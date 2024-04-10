FactoryBot.define do
  factory :restaurant do
    restaurant_place_id { SecureRandom.hex(91) }
    name { Faker::Address.city }
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
