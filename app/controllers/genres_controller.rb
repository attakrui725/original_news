class GenresController < ApplicationController
raise
def index
raise
end

def show
  @genre = Genre.where(id: params[:id])
end

end
