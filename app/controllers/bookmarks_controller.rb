class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    @list = List.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
			puts @bookmark.errors.full_messages
      render :new
    end
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'List not found.'
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
