class City < ApplicationRecord
  attribute :name, :string
  attribute :city_place_id, :string

  # Validations
  validates :name, presence: true
  validates :city_place_id, presence: true

  # Associations
  has_many :attractions
  has_many :restaurants
  has_many :hotels
  has_and_belongs_to_many :users
end
