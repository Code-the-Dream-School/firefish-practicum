class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :city_place_id
      t.string :name

      t.timestamps
    end
    add_index :cities, :city_place_id, unique: true
  end
end
