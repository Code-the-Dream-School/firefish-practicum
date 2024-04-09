FactoryBot.define do
  factory :city do
    city_place_id { SecureRandom.hex(51) }  
    name { Faker::Address.city }
  end
end
