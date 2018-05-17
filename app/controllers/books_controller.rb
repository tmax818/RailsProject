class BooksController < ApplicationController

  def index
    if current_user
      @books = current_user.books
      flash.now[:danger] = "You don't have any books yet" if @books.empty?
    else
      flash[:danger] = "Please log in or sign up."
      redirect_to root_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
      @book = Book.create(book_params)
      flash[:success] = "Book was added"
      redirect_to root_path
      debugger
  end

  def update

  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:author, :title, reviews_attributes:[:content])
  end

end
