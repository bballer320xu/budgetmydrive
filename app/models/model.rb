class Model < ActiveRecord::Base
  
  def self.model_years
    years = []
    self.select("DISTINCT model_year").order("model_year desc").all.each do |model|
      years << model.model_year
    end
    years
  end
  
  def self.model_make(model_year)
    makes = []
    self.where("model_year = ?", model_year).select("DISTINCT model_make").order("model_make asc").all.each do |model|
      makes << model.model_make.upcase
    end
    makes
  end
  
  def self.model_name(model_year, model_make)
    names = []
    self.where("model_year = ? AND model_make = ?", model_year, model_make).select("DISTINCT model_name").order("model_name asc").all.each do |model|
      names << model.model_name.upcase
    end
    names
  end
  
  def self.model_transmission(model_year, model_make, model_name)
    transmissions = []
    self.where("model_year = ? AND model_make = ? AND model_name = ?",  model_year, model_make, model_name).select("DISTINCT model_transmission").order("model_transmission asc").all.each do |model|
      transmissions << model.model_transmission.upcase
    end
    transmissions
  end
  
  def self.model_engine_size(model_year, model_make, model_name, model_transmission)
    engine_sizes = []
    self.where("model_year = ? AND model_make = ? AND model_name = ? AND model_transmission = ?", model_year, model_make, model_name, model_transmission).select("DISTINCT model_engine_size").order("model_engine_size asc").all.each do |model|
      engine_sizes << model.model_engine_size
    end
    engine_sizes
  end
  
  
  
  def self.by_all_params(model_year, model_make, model_name, model_transmission, engine_size)
    self.where("model_year = ? AND model_make = ? AND model_name = ? AND model_transmission = ? AND model_engine_size = ?", model_year, model_make, model_name, model_transmission, engine_size).first
  end
  
end
