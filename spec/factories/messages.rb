FactoryBot.define do
  factory :message do
    text        { Faker::Lorem.sentence }
    association :user
    association :article
    user_id { FactoryBot.create(:user).id }
    article_id { FactoryBot.create(:article).id }
  end
end
