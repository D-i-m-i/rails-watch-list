class BookmarksController < ApplicationController
  def new
    # @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def index
    @bookmarks = Bookmark.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new
    end
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to list_path(params[:list_id])
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
