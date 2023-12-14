class ListsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: "List was successfully created."
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :created_at, :updated_at)
  end

  def handle_not_found
    redirect_to root_path, alert: "List not found"
  end
end
