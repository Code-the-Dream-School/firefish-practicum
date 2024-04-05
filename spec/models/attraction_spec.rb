require 'rails_helper'

RSpec.describe Attraction, type: :model do
  subject { Attraction.new(attraction_place_id: "51bac81e88f63e5e4059bc7b68ef9d322d40f00102f901b44f9d010000000092030d51756961706f20436875726368", name: "Quiapo Church", address: "910 Plaza Miranda, Manila, 1001 Metro Manila, Philippines") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it { should validate_uniqueness_of(:attraction_place_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
