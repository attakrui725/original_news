class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
validates :name, presence: true

has_many :articles
has_many :messages
has_many :favorites, dependent: :destroy

  def already_favorited?(article)
    self.favorites.exists?(article_id: article.id)

  end
end
