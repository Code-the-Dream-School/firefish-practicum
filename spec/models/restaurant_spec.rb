require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject { Attraction.new(restaurant_place_id: "518709b485b13f5e40598e6ac0d952202d40f00103f901e1520d27000000009203164b656e6e7920526f676572732720526f617374657273", name: "Kenny Rogers' Roasters", address: "Taft Avenue, Manila, 1004 Metro Manila, Philippines") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it { should validate_uniqueness_of(:restaurant_place_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
