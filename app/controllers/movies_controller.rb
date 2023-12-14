class MoviesController < ApplicationController
  def index
      @movies = Movie.all
      @list = List.all
      @bookmark = Bookmark.new
  end

  def show

    @movie = Movie.find(params[:id])
    
  end
    
end
