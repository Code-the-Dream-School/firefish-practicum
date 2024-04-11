class AddCityToHotels < ActiveRecord::Migration[7.1]
  def change
    add_reference :hotels, :city, null: false, foreign_key: true
  end
end
