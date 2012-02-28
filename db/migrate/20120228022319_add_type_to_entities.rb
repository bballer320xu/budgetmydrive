class AddTypeToEntities < ActiveRecord::Migration
  def change
    add_column(:entities, :entity_type, :string)
  end
end
