class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_place_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.string :address
      t.string :image_url
      t.string :cuisine
      t.boolean :wheelchair
      t.string :indoor_seating
      t.string :outdoor_seating

      t.timestamps
    end
  end
end
