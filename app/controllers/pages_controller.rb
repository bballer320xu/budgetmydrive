require "gassy"

class PagesController < ApplicationController
  
  def index
    @regions = Entity.get_regions
    
    @dates = Set.new
    @by_entity = {}
    GasPrice.get_previous_prices(Date.today - 2.weeks,Date.today - 1.week).each do |entity| 
      @dates << entity.release_date
      if (Entity.find(entity.entity_id).entity_type == "region")
        @by_entity[Entity.find(entity.entity_id).name] = [{:release_date => entity.release_date, :price => entity.price}]
      end
    end
    
    GasPrice.get_previous_prices(Date.today - 1.week, Date.today).each do |entity|
      @dates << entity.release_date
      if (Entity.find(entity.entity_id).entity_type == "region")
        @by_entity[Entity.find(entity.entity_id).name] << {:release_date => entity.release_date, :price => entity.price}
      end
    end
    
    @dates = @dates.to_a.sort
    logger.debug @by_entity

    
    
  end
  
  def get_data 
    
    
    @year = params[:model][:model_year]
    @make =  params[:model][:model_make]
    @name =  params[:model][:model_name]
    @transmission =  params[:model][:model_transmission]
    @engine_size =  params[:model][:model_engine_size]
    @region_id = params[:region][:region_name]
    
    @model = Model.by_all_params(@year, @make, @name, @transmission, @engine_size)
    

    @mixed_mileage = @model.mileage_mixed.to_f
    
    @gas_price = GasPrice.get_latest_price_by_entity(Entity.find(@region_id))
    @daily_one_way_commute = params[:commute].to_f
    @weekly_other_miles = params[:other_miles].to_f
    
    
    @monthly_miles = 25.to_f * (@daily_one_way_commute * 2.to_f) + @weekly_other_miles

    @gallons_needed = @monthly_miles / @mixed_mileage
    
    @budget = (@monthly_miles / @mixed_mileage) * @gas_price.to_f
    
    render :json => {
      :current_gas_prices => @gas_price,
      :monthly_budget => @budget
    }

  end
  
  def update_model_make   
    render :json => {
      :values =>  Model.model_make(params[:id])
    }
  end
  
  def update_model_name
    render :json => {
      :values =>  Model.model_name(params[:model_year], params[:model_make])
    }
  end
  
  def update_model_transmission
    render :json => {
      :values =>  Model.model_transmission(params[:model_year], params[:model_make], params[:model_name])
    }
  end
  
  def update_model_engine_size
    render :json => {
      :values =>  Model.model_engine_size(params[:model_year], params[:model_make], params[:model_name], params[:model_transmission])
    }
  end
end
