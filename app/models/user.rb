class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
validates :name, presence: true

has_many :articles
has_many :messages
has_many :favorites, dependent: :destroy


  def liked_by?(article_id)
      favorites.where(article_id: article_id).exists?
  end
end
