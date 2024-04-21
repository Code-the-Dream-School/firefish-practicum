FactoryBot.define do
  factory :restaurant do
    association :city
    restaurant_place_id { SecureRandom.hex(51) }
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
    address { Faker::Address.full_address }
    image_url { Faker::LoremFlickr.image }
    cuisine { Faker::Food.ethnic_category }
    wheelchair { Faker::Boolean.boolean }
    indoor_seating { "Yes" }
    outdoor_seating { "No" }
  end
end
