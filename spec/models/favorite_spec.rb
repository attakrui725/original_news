require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { build(:favorite) }

  describe '記事をいいねする' do
    context 'いいねできるとき' do
      it 'user_id,article_idが存在すれば登録できる' do
        expect(favorite).to be_valid
      end
    end
    context 'いいねできないとき' do
      it 'user_idが空だと保存できない' do
        favorite.user_id = ''
        favorite.valid?
        expect(favorite.errors.full_messages).to include "User can't be blank"
      end
      it 'article_idが空では登録できない' do
        favorite.article_id = ''
        favorite.valid?
        expect(favorite.errors.full_messages).to include 'Article must exist'
      end
    end
  end
end
