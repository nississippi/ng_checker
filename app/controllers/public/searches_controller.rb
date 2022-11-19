class Public::SearchesController < ApplicationController


  require 'themoviedb-api'
  Tmdb::Api.key(ENV["TMDB_KEY"])
  Tmdb::Api.language("ja")


  def search
    @range = params[:range]

    if @range == "NgExpression"
      @ng_expressions = NgExpression.looks(params[:search], params[:word])
    else
      @contents = Content.looks(params[:search], params[:word])
    end
  end
end
