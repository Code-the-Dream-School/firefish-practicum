FactoryBot.define do
  factory :hotel do
    association :city
    hotel_place_id { SecureRandom.hex(91) }
    name { Faker::Address.city }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
    address { Faker::Address.full_address }
    image_url { Faker::LoremFlickr.image }
    wheelchair { Faker::Boolean.boolean }
    stars { Faker::Number.within(range: 1..5) }
  end
end
