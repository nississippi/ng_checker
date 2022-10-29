class Public::NgExpressionsController < ApplicationController
  def index
    if params[:ng_genre_id]
      @ng_genre = NgGenre.find(params[:ng_genre_id])
      all_ng_expressions = @ng_genre.ng_expressions
    else
      all_ng_expressions = NgExpression.all
    end
    @ng_expressions = all_ng_expressions.page(params[:page])
    @all_ng_expressions_count = all_ng_expressions.count
  end

  def show
    @ng_expression = NgExpression.find(params[:id])
  end

  def create
    ng_expression = NgExpression.new(ng_expression_params)
    ng_expression.save
    redirect_to content_path(content)
  end

  private

  def ng_expression_params
    params.require(:ng_expression).permit(:vote)
  end
end
