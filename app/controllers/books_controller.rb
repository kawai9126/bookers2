class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @post_comment = PostComment.new
    @post_comments = @book.post_comments
  end
  def edit
     @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end

  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have book updated successfully"
       redirect_to book_path
    else
      render "edit"
    end
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
