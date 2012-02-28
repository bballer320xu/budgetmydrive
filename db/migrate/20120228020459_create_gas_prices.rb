class CreateGasPrices < ActiveRecord::Migration
  def change
    create_table :gas_prices do |t|
      t.date :release_date
      t.integer :entity_id
      t.decimal :price

      t.timestamps
    end
  end
end
