class Public::NgAnswersController < ApplicationController

  def create
    ng_answer = NgAnswer.new(ng_expression_id: ng_answer_params[:ng_expression_id],
    content_id: ng_answer_params[:content_id],
    customer_id: current_customer.id, vote: ng_answer_params[:vote].to_i)

    ng_answer.save
    #content = ng_answer.ng_expression.content
    # TODO refere リファラーというやつを使うと元居たページに戻れる
    redirect_to content_path(ng_answer_params[:content_id])
  end

  def destroy
    content = Content.find(params[:content_id])
    ng_expression = NgExpression.find(params[:ng_expression_id])
    ng_answer = current_customer.ng_answers.find_by(content_id: content.id, ng_expression_id: ng_expression.id)
    ng_answer.destroy
    redirect_to content_path(params[:content_id])
  end

  private

#permitの中身はビューから送られてくるデータ（params）なのでカスタマーIDいらない
  def ng_answer_params
    #form_withが送ってくるデータは名前：データの形になっており、requireの後ろはフォームの名前
    #params.require(:ng_answer).permit(:vote, :ng_expression_id, :content_id)
    params.permit(:vote, :ng_expression_id, :content_id)
  end
end
