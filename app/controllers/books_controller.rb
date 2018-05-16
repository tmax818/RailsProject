class BooksController < ApplicationController

  def index

  end

  def show

  end

  def new
    @book = Book.new
  end

  def edit

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Welcome to the Reader's Library"
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
    params.require(:book).permit(:author, :title)
  end

end
