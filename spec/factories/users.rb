FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) }
  end
end
