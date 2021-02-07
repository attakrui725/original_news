require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { build(:message) }

  describe 'コメントの新規投稿' do
    context '新規投稿できるとき' do
      it 'text,user_id,article_idが存在すれば登録できる' do
        expect(message).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'textが空だと保存できない' do
        message.text = ''
        message.valid?
        expect(message.errors.full_messages).to include "Text can't be blank"
      end
      it 'user_idが空では登録できない' do
        message.user_id = ''
        message.valid?
        expect(message.errors.full_messages).to include "User can't be blank"
      end
      it 'artilce_idが空では登録できない' do
        message.article_id = ''
        message.valid?
        expect(message.errors.full_messages).to include "Article can't be blank"
      end
    end
  end
end
