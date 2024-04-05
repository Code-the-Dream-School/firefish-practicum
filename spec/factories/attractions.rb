FactoryBot.define do
  factory :attraction do
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
