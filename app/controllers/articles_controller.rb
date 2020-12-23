class ArticlesController < ApplicationController


  def index
    @articles = Article.all


  end

  def new
    @article = Article.new

  end

  def create
    binding.pry
    # @article = Article.new(article_params)
    # if @article.save
    #   redirect_to root_path
    # else
    #   render :new
    # end

    agent = Mechanize.new
    page = agent.get(params[:article][:url])                    #投稿内容から記事のURLを取得
    title_ele = page.title                                      #urlからタイトル情報の取得
    content_ele = page.at('meta[property="og:description"]')    #urlから詳細情報の取得
    image_ele = page.at('meta[property="og:image"]')            #urlからサムネイル画像の取得
    image = image_ele.get_attribute(:content)
    @article = Article.new(name: title_ele, description: content_ele, image: image, url: (params[:article][:url]), user_id: current_user.id)          #Articleモデルの生成
    @article.save
    #データの保存


  end

  def show
    @article = Article.find(params[:id])
    @message = Message.new
    @messages = @article.messages.includes(:user)

#スクレイピングの記述
    agent = Mechanize.new
    page = agent.get("#{@article.url}")
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

  private
  def article_params
  params.require(:article).permit(:name, :description, :image, :url).merge(user_id: current_user.id)

  end

end
