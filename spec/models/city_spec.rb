require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city_place_id) }
  end

  describe "associations" do
    it { should have_many(:attractions) }
    it { should have_many(:hotels) }
    it { should have_many(:restaurants) }
  end
end
