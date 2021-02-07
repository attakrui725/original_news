FactoryBot.define do
  factory :article do
    association :user

    name        { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    url         { Faker::Lorem.sentence }
    img         { Faker::Lorem.sentence }
    genre_id    { 2 }
    user_id { FactoryBot.create(:user).id }
  end
end
