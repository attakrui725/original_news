class FavoritesController < ApplicationController

  def create
    @article = Article.find(params[:id])
    Favorite.create(user_id: current_user.id, article_id: params[:id])

  end

  def destroy
    @article = Article.find(params[:id])
    Favorite.find_by(user_id: current_user.id, article_id: params[:id]).destroy

  end

end
