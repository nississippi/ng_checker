class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    @content = Content.find(params[:content_id])
  end

  def create
    @comment = Comment.new(
      ng_expression_id: comment_params[:ng_expression_id],
      content_id: comment_params[:content_id],
      customer_id: current_customer.id,
      comment: comment_params[:comment])
    # 投稿ボタンを押下した場合
    if params[:post]
      if @comment.save
        #クエリパラメータでcontent_idを渡す必要がある
        redirect_to ng_expression_comments_path(content_id: comment_params[:content_id])
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      if @comment.update(is_draft: true)
        redirect_to ng_expression_comments_path(content_id: comment_params[:content_id]),
        notice: "コメントを下書き保存しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def index
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    @content = Content.find(params[:content_id])
    @comments = @ng_expression.comments.where(content_id: @content.id)
    @all_comments_count = @comments.count
  end

  def edit
    @comment = Comment.find(params[:id])
    @ng_expression = NgExpression.find(params[:ng_expression_id])
    @content = Content.find(params[:content_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to ng_expression_comments_path(content_id: comment_params[:content_id])
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    content_id = comment.content_id
    comment.destroy
    redirect_to ng_expression_comments_path(content_id: content_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :ng_expression_id, :content_id)
  end
end
