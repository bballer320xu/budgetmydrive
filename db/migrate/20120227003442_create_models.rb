class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.integer :model_year
      t.string :model_make
      t.string :model_name
      t.string :model_transmission
      t.string :model_engine_size
      t.integer :mileage_city
      t.integer :mileage_highway
      t.integer :mileage_mixed 
      t.timestamps
    end
  end
end
