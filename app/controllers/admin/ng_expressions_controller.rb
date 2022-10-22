class Admin::NgExpressionsController < ApplicationController
  def index
    @ng_expression = NgExpression.new

    if params[:ng_genre_id]
      @ng_genre = NgGenre.find(params[:ng_genre_id])
      all_ng_expressions = @ng_genre.ng_expressions
    else
      all_ng_expressions = NgExpression.all
    end
    @ng_expressions = all_ng_expressions.page(params[:page])
    @all_ng_expressions_count = all_ng_expressions.count
  end

  def create
    @ng_expression = NgExpression.new(ng_expression_params)
    if @ng_expression.save
      redirect_to admin_ng_expressions_path
    else
      if params[:ng_genre_id]
        @ng_genre = NgGenre.find(params[:ng_genre_id])
        all_ng_expressions = @ng_genre.ng_expressions
      else
        all_ng_expressions = NgExpression.all
      end
      @ng_expressions = all_ng_expressions.page(params[:page])
      render :index
    end
  end

  def show
  end

  def edit
    @ng_expression = NgExpression.find(params[:id])
  end

  def update
    @ng_expression.update(ng_expression_params) ? (redirect_to admin_ng_expressions_path) : (render :edit)
  end

  def destroy
    NgExpression.find_by(id: params[:id]).destroy
    redirect_to admin_ng_expressions_path
  end

  private

  def ng_expression_params
    params.require(:ng_expression).permit(:ng_genre_id, :ng_expression)
  end

end
