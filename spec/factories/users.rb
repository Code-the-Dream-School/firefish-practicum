FactoryBot.define do
  factory :user do |f|
    f.username { Faker::Name.unique.name }
    f.email { Faker::Internet.unique.email }
    f.password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) }
  end
end