class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "NgExpression"
      @ng_expressions = NgExpression.looks(params[:search], params[:word])
    else
      @contents = Content.looks(params[:search], params[:word])
    end
  end
end
