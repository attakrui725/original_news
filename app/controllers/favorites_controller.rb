class FavoritesController < ApplicationController

def create

  @article = Article.find(params[:id])
  favorite = current_user.favorites.build(article_id: params[:id])
  favorite.save


end

def destroy
  @article = Article.find(params[:id])
  favorite = Favorite.find_by(article_id: params[:id], user_id: current_user.id)
  favorite.destroy
end

end
