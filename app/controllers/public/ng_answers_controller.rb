class Public::NgAnswersController < ApplicationController

  def create
    ng_answer = NgAnswer.new(ng_expression_id: params[:ng_expression_id], customer_id: current_customer.id, vote: params[:vote].to_i)
    ng_answer.save
    #content = ng_answer.ng_expression.content
    # TODO refere リファラーというやつを使うと元居たページに戻れる
    redirect_to root_path #content_path(content)
  end
  
  def destroy
    ng_answer = NgAnswer.find(params[:id])
    ng_answer.destroy
    redirect_to root_path #content_path(content)
  end

  private

  def ng_answer_params
    params.require(:ng_answer).permit(:vote, :customer_id, :ng_expression_id)
  end
end
