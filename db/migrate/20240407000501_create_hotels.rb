class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_place_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.string :address
      t.string :image_url
      t.boolean :wheelchair
      t.integer :stars

      t.timestamps
    end
  end
end
