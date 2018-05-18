class BooksController < ApplicationController


  def index
    if params[:user_id]
      @books = User.find(params[:user_id]).books
      flash.now[:danger] = "You haven't added any books yet!" if @books.empty?
    end
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :genre_id)
  end

end
