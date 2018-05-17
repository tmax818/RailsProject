class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.user_id = current_user.id 
    debugger
  end

  private
    def review_params
      params.require(:review).permit(:content, :book_id)
    end
end
