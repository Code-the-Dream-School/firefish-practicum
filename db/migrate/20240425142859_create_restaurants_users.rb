class CreateRestaurantsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants_users do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
