class City < ApplicationRecord
  belongs_to :user
  attribute :user_id
  attribute :name, :string
  attribute :city, :string
  attribute :country, :string
  attribute :city_place_id, :string

  # Fields
  validates :city_place_id, presence: true
  validates :name, presence: true

  # Associations
  has_many :attractions
  has_many :restaurants
  has_many :hotels

  def full_address
    "#{city}, #{country}" 
  end
end
