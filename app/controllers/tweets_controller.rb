class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    logger.debug @tweets.count
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdat: Time.current)
    if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      render new_tweet_path
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(message: params[:tweet][:message])
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      redirect_to edit_tweet_path
    end
  end
end

