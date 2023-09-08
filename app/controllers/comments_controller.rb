class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comment = Comment.new
    @comments = Comment.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to tweet_path(@tweet), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id]) 
    end

    def comment_params
      params.require(:comment).permit(:comments)
    end
end
