class GasPrice < ActiveRecord::Base
  attr_accessible :release_date, :entity_id, :price
  
  def self.get_latest_price_by_entity(entity)
    release_date = self.get_latest_date
    self.where("entity_id = ? AND release_date = ?", entity, release_date).first.price
  end
  
  def self.get_latest_date
    self.maximum(:release_date, :group => 'entity_id').first[1]
  end
end
