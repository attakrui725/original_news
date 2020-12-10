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
      binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

private
def article_params
  params.require(:article).permit(:name, :description, :image).merge(user_id: current_user.id)
  
end

end
