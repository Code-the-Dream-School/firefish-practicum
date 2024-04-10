class CreateAttractions < ActiveRecord::Migration[7.1]
  def change
    create_table :attractions do |t|
      t.string :attraction_place_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.text :address
      t.string :image_url
      t.boolean :toilets
      t.boolean :wheelchair
      t.boolean :changing_table

      t.timestamps
    end
  end
end
