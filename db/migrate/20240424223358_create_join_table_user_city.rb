class CreateJoinTableUserCity < ActiveRecord::Migration[7.1]
  def change
    create_join_table :Users, :Cities do |t|
      t.index [:user_id, :city_id]
      t.index [:city_id, :user_id]
    end
  end
end
