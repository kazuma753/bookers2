class BooksController < ApplicationController
	    before_action :authenticate_user!
      before_action :correct_user, only: [:edit, :update]
  def index
    @book_comment = BookComment.new
  	@book = Book.new
  	@books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
 if @book.save
    redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
 else 
    @books = Book.all
    render :index
  end
  end

  def show
    @book = Book.new
    @book_comment = BookComment.new
    @books = Book.find(params[:id])
    @comments = @books.book_comments
  	@user = @books.user
    @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else 
    render :edit
  end
end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  def search
    method = params[:search_method]
    word = params[:search_word]
    @books = Book.search(method,word)
end

  

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
      
    end
  end
end
