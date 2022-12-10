class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @keyword= params[:search]
    if @keyword.present?
      @keywords=@keyword.split(/[[:blank:]]+/)
      @keywords.each do |keyword|
        @tweets = Tweet.where("body LIKE ?", "%#{keyword}%")
      end
      @tweets = @tweets.sort {|a,b| b.body.length <=> a.body.length }
    else
      @tweets = Tweet.all.sort {|a,b| a.body.length <=> b.body.length }
    end

    # if params[:search] == nil
    #   @tweets= Tweet.all.sort {|a,b| b.body.length <=> a.body.length }
    # elsif params[:search] == ''
    #   @tweets= Tweet.all.sort {|a,b| b.body.length <=> a.body.length }
    # else
    #   @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.body.length <=> a.body.length }
    # end
    @tweet = Tweet.new
    @post=Post.new
    @posts=Post.all.order(n: :asc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.new
    @comments = @tweet.comments.order(created_at: :desc)
    @comment = @tweet.comments.build
  end

  def aggregateOpinion(array)
    result = [["賛成",0],["反対",0],["どちらでもない",0]]
    array.each do |i|
      if i == 0
        result[0][1] += 1
      elsif i == 1
        result[1][1] += 1
      elsif i == 2
        result[2][1] += 1
      else
      end
    end
    return result
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to("/tweets/:id")
    else
      redirect_to("/tweets/new")
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body,:title,:image)
  end

end
