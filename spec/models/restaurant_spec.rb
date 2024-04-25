require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'validations' do
    let(:city) { create(:city) }
    it 'is valid with valid attributes' do
      restaurant = build(:restaurant, city: city)
      expect(restaurant).to be_valid
    end
    it 'is not valid without a city' do
      restaurant = build(:restaurant, city: nil)
      expect(restaurant).not_to be_valid
    end
    it 'validates uniqueness of restaurant_place_id' do
      create(:restaurant, restaurant_place_id: "unique_id", city: city)
      restaurant = build(:restaurant, restaurant_place_id: "unique_id", city: city)
      expect(restaurant).not_to be_valid
    end

    context "associations" do
      it { should belong_to(:city) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:address) }
      it { should belong_to(:city) }
    end
  end
end
