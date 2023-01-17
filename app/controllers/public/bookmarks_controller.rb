class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    bookmark = @ng_expression.bookmarks.new(customer_id: current_customer.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    bookmark = @ng_expression.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
    end
    redirect_to request.referer
  end
end
