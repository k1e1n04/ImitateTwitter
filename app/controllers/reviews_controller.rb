class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def review_params
    params.require(:review).permit(:body).merge(reviewer_id: current_user.id, reviewing_id: params[:user_id])
  end
end
