class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    @content = Content.find(params[:content_id])
    @comments = @ng_expression.comments.where(content_id: @content.id)
    @all_comments_count = @comments.count
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to request.referer
  end
end
