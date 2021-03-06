class ArticlesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @articles = Article.page(params[:page]).per(5).order('created_at DESC')
    @genres = Genre.all
  end

  def new
    @article = Article.new
  end

  def create
    agent = Mechanize.new
    page = agent.get(params[:article][:url])                    # 投稿内容から記事のURLを取得
    title_ele = page.title                                      # urlからタイトル情報の取得
    content_ele = page.at('meta[property="og:description"]')    # urlから詳細情報の取得
    content = content_ele.get_attribute(:content)
    img_ele = page.at('meta[property="og:image"]')                # urlからサムネイル画像の取得
    img = img_ele.get_attribute(:content)                         # url情報のみへの絞り込み
  @article = Article.new(
                       name: title_ele,
                       description: content,
                       img: img,
                       url: (params[:article][:url]),
                       user_id: current_user.id,
                       genre_id: (params[:article][:genre_id])
)

    if @article.save # データの保存
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @message = Message.new
    @messages = @article.messages.includes(:user)

    # スクレイピングの記述
    agent = Mechanize.new
    page = agent.get(@article.url.to_s)
    elements = page.title
    @title = elements

    content = page.at('meta[property="og:image"]')
    @image = content.get_attribute(:content)
  end

  def update
    @article = Article.find(params[:id])
    @article_params.update(article_params)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def search
    @results = @q.result
  end

  private

  def article_params
    params.require(:article).permit(:name, :description, :image, :url).merge(user_id: current_user.id)
  end

  def set_q
    @q = Article.ransack(params[:q])
  end
end
