class CreateHotelsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels_users do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
