class Article < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :user_id
  end
  validates :genre_id, numericality: { other_than: 1 }

  belongs_to :user
  has_many :messages,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
