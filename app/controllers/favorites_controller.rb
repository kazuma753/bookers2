class FavoritesController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    if @favorite.save
      flash[:success] = "いいね登録しました"
      redirect_back(fallback_location: books_path)
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    if @favorite.destroy
      flash[:success] = "いいね解除しました"
      redirect_back(fallback_location: books_path)
    end
  end
end
