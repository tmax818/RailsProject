class StaticController < ApplicationController

  def home
  end

  def title

  end

  def author
    @books = Book.all
  end

end
