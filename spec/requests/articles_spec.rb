require 'rails_helper'
RSpec.describe ArticlesController, type: :request do
let(:article) { build(:article) }

  describe "GET /index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
    get '/'
      expect(response).to be_success
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のタイトルが存在する' do
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事のの詳細が存在する' do
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの記事の写真が存在する' do
    end
  end
end
