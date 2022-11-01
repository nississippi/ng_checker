class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def index
    @comments = Comment.page(params[:page])
    @all_comments_count = @comments.count
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
