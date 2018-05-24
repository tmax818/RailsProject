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

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.create(review_params)
    @review.user_id = current_user.id
     if @review.save
       redirect_to @review
     else
       render :new
     end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy

  end

  private
    def review_params
      params.require(:review).permit(:content, :book_id)
    end
end
