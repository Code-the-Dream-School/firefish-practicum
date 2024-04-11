class Restaurant < ApplicationRecord
    belongs_to :city
    validates :restaurant_place_id, presence: true, uniqueness: true
    validates :name, presence: true
    validates :address, presence: true
end
