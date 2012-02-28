
task :load_weekly_prices => :environment do
  Gassy.get_all_price_data.each do |k,v|
    v.each_pair do |name,value|
      @entity = Entity.find_by_name(name)
      begin
        @entity = Entity.find_by_name(name)
        if(GasPrice.where("entity_id = ? AND price = ? and release_date = ?", @entity.id, value.to_d, Date.today).length == 0)
          puts "Adding #{Date.today} gas price #{value} for the entity #{@entity.name}"
          @gas_price = GasPrice.create(:entity_id => @entity.id, :price => value.to_d, release_date: Date.today)
        end
      rescue 
        puts "The gas price could not be created for the entity."
      end
    end
  end  
end
