require 'rails_helper'

RSpec.describe Hotel, type: :model do
  subject { Hotel.new(hotel_place_id: "51f520f3b7f3555e405998a7ef2444a82840f00103f901254a821d0100000092031c42756c616c6163616f20486f74656c20262052657374617572616e74", name: "Bulalacao Hotel & Restaurant", address: "Mindoro East Coastal Road, Bulalacao, Oriental Mindoro, Philippines") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it { should validate_uniqueness_of(:hotel_place_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
