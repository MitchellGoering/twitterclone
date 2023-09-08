class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ like unlike show edit update destroy ]

  def like
    @tweet.likes.create(user: current_user, liked_at: Time.current)
  end

  def unlike
    @tweet.likes.find_by(user: current_user).delete
  end

  def index
    @tweet = Tweet.new
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def show
    @comments = @tweet.comments
    @comment = Comment.new
    @likes = @tweet.likes.count
  
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path (@tweet), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:tweet)
    end
end
