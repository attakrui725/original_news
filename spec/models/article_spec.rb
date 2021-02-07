require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }

  describe '記事の新規投稿' do
    context '新規投稿できるとき' do
      it 'name,email、descriotion,url,img,genre_id,user_idが存在すれば登録できる' do
        expect(article).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'nameが空だと登録できない' do
        article.name = ''
        article.valid?
        expect(article.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        article.description = ''
        article.valid?
        expect(article.errors.full_messages).to include "Description can't be blank"
      end
      it 'urlが空では登録できない' do
        article.url = ''
        article.valid?
        expect(article.errors.full_messages).to include "Url can't be blank"
      end
      it 'imgが空では登録できない' do
        article.img = ''
        article.valid?
        expect(article.errors.full_messages).to include "Img can't be blank"
      end
      it 'genre_idが１では登録できない' do
        article.genre_id = '1'
        article.valid?
        expect(article.errors.full_messages).to include 'Genre must be other than 1'
      end
      it 'user_idがなければ登録できない' do
        article.user_id = ''
        article.valid?
        expect(article.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
