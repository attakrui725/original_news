class Article < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :user_id
  end

  
belongs_to :user
has_one_attached :image
end
