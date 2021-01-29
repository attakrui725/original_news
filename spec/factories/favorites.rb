FactoryBot.define do
  factory :favorite do
    user_id { FactoryBot.create(:user).id }
    article_id { FactoryBot.create(:article).id }
  end
end
