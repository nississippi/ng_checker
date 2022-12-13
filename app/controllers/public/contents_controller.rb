class Public::ContentsController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key(ENV["TMDB_KEY"])
  Tmdb::Api.language("ja")

  def create
    #送られてきた映画のタイトルがcontentモデルのタイトルカラムにあるか調べてなければデータ保存する
    #下記のままでは部分一致idが一番若いものを登録してしまう？
    #binding.pry
    @content = Content.find_or_create_by(
      title: params[:name], release_date: params[:release], tmdb_id: params[:tmdb_id]
      )
    redirect_to content_path(@content)
  end

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
    @ng_answers = @content.ng_answers
  end
end
