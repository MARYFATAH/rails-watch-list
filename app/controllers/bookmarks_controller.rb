
  class BookmarksController < ApplicationController

    def new
      @list = List.find(params[:list_id])
      @bookmark = @list.bookmarks.build
      @movies = Movie.all
    end

    def create
      @bookmark = Bookmark.new(bookmark_params)
      @list = List.find(params[:list_id])
      @bookmark.list = @list
      if @bookmark.save
        redirect_to @bookmark.list
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @list = @bookmark.list
      @bookmark.destroy
      redirect_to @list
    end

    private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
  end
