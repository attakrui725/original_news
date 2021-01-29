FactoryBot.define do
    factory :article do
    name        {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    url         {Faker::Lorem.sentence}
    img         {Faker::Lorem.sentence}
    genre_id    {2}
    association :user
  end
end
