FactoryBot.define do
  factory :attraction do
    attraction_place_id { "MyString" }
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    website { "MyString" }
    address { "MyText" }
    image_url { "MyString" }
    toilets { false }
    wheelchair { false }
    changing_table { false }
  end
end
