class Message < ApplicationRecord
  belongs_to :article
  belongs_to :user

  with_options presence: true do
  validates :text
  validates :user_id
  validates :article_id
  end
end
