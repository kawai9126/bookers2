class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)


  end

  def follow
    @user = current_user
    @users = @user.following_user
  end

  def follower
    @user = current_user
    @users = @user.follower_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new

  end
  def edit
     @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have uptated user successfully"
       redirect_to user_path(@user.id)
    else
      render "edit"
    end

  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title,:body)
  end


end
