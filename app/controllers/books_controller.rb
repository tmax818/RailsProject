class BooksController < ApplicationController


  def index
    if params[:user_id]
      @books = User.find(params[:user_id]).books
      flash.now[:danger] = "You haven't added any books yet!" if @books.empty?
    end
  end


  def new
    
  end

  def show
    @book = Book.find(params[:id])
  end



end
