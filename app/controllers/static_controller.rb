class StaticController < ApplicationController

  def home
  end

  def help

  end

  def about
    @books = Book.all
  end

end
