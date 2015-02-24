class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.new(comment_params)
    @comment.user = current_user

    if @pin.save
      redirect_to @pin, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back, notice: 'Comment was successfully destroyed.'
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:pin_id, :body, :user_id)
    end
end
