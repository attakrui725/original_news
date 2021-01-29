require 'rails_helper'

RSpec.describe Relationship, type: :model do
let(:relationship){build(:relationship)}

  describe 'ユーザーをフォローをする' do
  context 'フォローできるとき' do
    it "user_id,follow_idが存在すれば登録できる" do
    expect(relationship).to be_valid
    end
  end
  context '新規投稿できないとき' do
    it "user_idが空だと保存できない" do
      relationship.user_id = ""
      relationship.valid?
      expect(relationship.errors.full_messages).to include "User can't be blank"
    end
    it "follow_idが空では登録できない" do
      relationship.follow_id = ""
      relationship.valid?
      expect(relationship.errors.full_messages).to include "Follow must exist"
    end
  end
  end
end
