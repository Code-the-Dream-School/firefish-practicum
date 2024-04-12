require 'rails_helper'

RSpec.describe Attraction, type: :model do
  describe 'validations' do
    let(:city) { create(:city) }
    it 'is valid with valid attributes' do
      attraction = build(:attraction, city: city)
      expect(attraction).to be_valid
    end
    it 'is not valid without a city' do
      attraction = build(:attraction, city: nil)
      expect(attraction).not_to be_valid
    end
    it 'validates uniqueness of attraction_place_id' do
      create(:attraction, attraction_place_id: "unique_id", city: city)
      attraction = build(:attraction, attraction_place_id: "unique_id", city: city)
      expect(attraction).not_to be_valid
    end

    it { should belong_to(:city) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }

  end
end