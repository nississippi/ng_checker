class Public::NgAnswersController < ApplicationController
  before_action :authenticate_customer!

  def create
    @content = Content.find(params[:content_id])
    @ng_expressions = NgExpression.all
    @comments = Comment.where(content_id: @content.id, is_draft: false)
    current_ng_answer = NgAnswer.find_by(
      ng_expression_id: ng_answer_params[:ng_expression_id],
      content_id: ng_answer_params[:content_id],
      customer_id: current_customer.id)

    if current_ng_answer
      current_ng_answer.destroy!

      if current_ng_answer.vote_before_type_cast == ng_answer_params[:vote].to_i
        #returnで処理終了
        #content_pathへのredirectだとNG詳細ページから投票しても映画詳細ページに飛んでしまうので記述変更
        #return redirect_to content_path(ng_answer_params[:content_id])
        # return redirect_to request.referer
      end
    end

    ng_answer = NgAnswer.new(
      ng_expression_id: ng_answer_params[:ng_expression_id],
      content_id: ng_answer_params[:content_id],
      customer_id: current_customer.id,
      vote: ng_answer_params[:vote].to_i)

    ng_answer.save
    #content = ng_answer.ng_expression.content
    # TODO refere リファラーというやつを使うと元居たページに戻れる
    #redirect_to content_path(ng_answer_params[:content_id])
    # redirect_to request.referer
  end

  private

#permitの中身はビューから送られてくるデータ（params）なのでカスタマーIDいらない
  def ng_answer_params
    #form_withが送ってくるデータは名前：データの形になっており、requireの後ろはフォームの名前
    #params.require(:ng_answer).permit(:vote, :ng_expression_id, :content_id)
    params.permit(:vote, :ng_expression_id, :content_id)
  end
end
