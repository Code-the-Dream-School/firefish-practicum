class AddIndexToCitiesName < ActiveRecord::Migration[7.1]
  def change
    add_index :cities, :name, name: "index_for_city_name", unique: true
  end
end
