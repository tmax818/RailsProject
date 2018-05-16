class BooksController < ApplicationController

  def index
    if current_user
      @books = current_user.books
      flash.now[:danger] = "You don't have any books yet" if @books.empty?
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was added"
      redirect_to @book
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
  def book_params
    params.require(:book).permit(:author, :title, :genre_id)
  end

end
