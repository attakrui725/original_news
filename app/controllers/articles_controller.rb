class ArticlesController < ApplicationController
  def index
  end

  def new
    @articlse = Articles.new
  end
end
