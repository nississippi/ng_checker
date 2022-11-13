class Admin::CommentsController < ApplicationController
  def index
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    @content = Content.find(params[:content_id])
    @comments = @ng_expression.comments.where(content_id: @content.id)
    @all_comments_count = @comments.count
  end
  
  def destroy
    comment = Comment.find_by(id: params[:id])
    content_id = comment.content_id
    comment.destroy
    redirect_to admin_ng_expression_comments_path(content_id: content_id)
  end
end
