class Public::VotesController < ApplicationController
  def create

    ng_expression = NgExpression.find(params[:ng_expression_id])
    vote = current_customer.votes.new(ng_expression_id: ng_expression.id)
    vote.save
    redirect_to content_path(content)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
