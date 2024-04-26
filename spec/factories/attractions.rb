FactoryBot.define do
  factory :attraction do
    association :city
    attraction_place_id { SecureRandom.hex(51) }
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    website { Faker::Internet.url }
    address { Faker::Address.full_address }
    image_url { Faker::LoremFlickr.image }
    toilets { Faker::Boolean.boolean }
    wheelchair { Faker::Boolean.boolean }
    changing_table { Faker::Boolean.boolean }
  end
end
