class GenresController < ApplicationController


def show
  @genre = Genre.find_by(id: params[:id])
  @articles = Article.where(genre_id: params[:id])


end

end
