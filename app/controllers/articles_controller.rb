class ArticlesController < ApplicationController


  def index
    @articles = Article.all


  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
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
