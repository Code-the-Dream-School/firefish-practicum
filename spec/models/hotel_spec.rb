require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validations' do
    let(:city) { create(:city) } 
    it 'is valid with valid attributes' do
      hotel = build(:hotel, city: city)
      expect(hotel).to be_valid
    end
    it 'is not valid without a city' do
      hotel = build(:hotel, city: nil)
      expect(hotel).not_to be_valid
    end
    it 'validates uniqueness of hotel_place_id' do
      create(:hotel, hotel_place_id: "unique_id", city: city)
      hotel = build(:hotel, hotel_place_id: "unique_id", city: city)
      expect(hotel).not_to be_valid
    end
    it { should belong_to(:city) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end
end
