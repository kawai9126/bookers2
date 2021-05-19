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
  def show
    @user = User.find(params[:id])
    @books = @user.books.all

  end
  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end


end
