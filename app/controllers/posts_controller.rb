class PostsController < ApplicationController
  def index
    @posts = Post.all.order(n: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_back(fallback_location: tweets_path)
    else
      redirect_back(fallback_location: tweets_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:n)
  end
end
