class Entity < ActiveRecord::Base
  
  def self.get_cities
    self.where("entity_type = ?", "city")
  end
  
  def self.get_states
    self.where("entity_type = ?", "state")
  end
  
  def self.get_regions
    self.where("entity_type = ?", "region")
  end
  
  def self.get_nationwide
    self.where("entity_type = ?", "nationwide")
  end
end
