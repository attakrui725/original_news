class GenresController < ApplicationController


def show
  @genre = Genre.where(id: params[:id])
end

end
