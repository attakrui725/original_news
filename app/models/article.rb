class Article < ApplicationRecord
  with_options presence: true do

    validates :name
    validates :description
    validates :user_id
  end


belongs_to :user
has_many :messages
has_one_attached :image
end
