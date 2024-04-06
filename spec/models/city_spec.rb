require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city_place_id) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:city) }
  end
end
