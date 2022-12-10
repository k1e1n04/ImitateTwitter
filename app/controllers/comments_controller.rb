class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    @comment = tweet.comments.build(comment_params) 
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: tweets_path)
    else
      redirect_back(fallback_location: tweets_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_back(fallback_location: tweets_path)
    else
      redirect_back(fallback_location: tweets_path)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_back(fallback_location: tweets_path)
    else
      redirect_back(fallback_location: tweets_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
