class BookmarksController < ApplicationController
  def new
    begin
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    rescue ActiveRecord::RecordNotFound
      # Si la liste n'est pas trouvée, rediriger vers une autre page avec un message d'erreur
      flash[:alert] = "La liste demandée n'a pas été trouvée."
      redirect_to root_path # Remplacez 'some_other_path' par le chemin de redirection souhaité
    end
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
