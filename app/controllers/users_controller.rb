class UsersController < ApplicationController
     before_action :authenticate_user!
     before_action :correct_user, only: [:edit, :update]
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def show
  	 @user = User.find(params[:id])
     @book = Book.new
  	 @books = @user.books
  end

  def index
  	 @users = User.all
  	 @book = Book.new
  end

  def edit
  	 @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])#ユーザーの情報を特定する
    if @user.update(user_params)#更新する
      redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
      else 
      render :edit
    end
  end

 private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

end
