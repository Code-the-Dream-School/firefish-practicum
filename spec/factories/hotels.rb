FactoryBot.define do
  factory :hotel do
    hotel_place_id { "MyString" }
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    website { "MyString" }
    address { "MyString" }
    image_url { "MyString" }
    wheelchair { false }
    stars { 1 }
  end
end
