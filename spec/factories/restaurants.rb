FactoryBot.define do
  factory :restaurant do
    restaurant_place_id { "MyString" }
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    website { "MyString" }
    address { "MyString" }
    image_url { "MyString" }
    cuisine { "MyString" }
    wheelchair { false }
    indoor_seating { "MyString" }
    outdoor_seating { "MyString" }
  end
end
