class Public::ContentsController < ApplicationController
  def index
    #時間できたら絞り込み機能つける
    @contents = Content.page(params[:page])
    @all_contents_count = @contents.count
  end

  def show
    @content = Content.find(params[:id])
    if params[:ng_genre_id]
      @ng_genre = NgGenre.find(params[:ng_genre_id])
      all_ng_expressions = @ng_genre.ng_expressions
    else
      all_ng_expressions = NgExpression.all
    end
    @ng_expressions = all_ng_expressions.page(params[:page])
    @all_ng_expressions_count = all_ng_expressions.count
  end

end
