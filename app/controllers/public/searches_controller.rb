class Public::SearchesController < ApplicationController


  require 'themoviedb-api'
  Tmdb::Api.key(ENV["TMDB_KEY"])
  Tmdb::Api.language("ja")


  def search
    @range = params[:range]

    if @range == "NgExpression"
      @ng_expression = params[:looking_for]
      @ng_expressions = NgExpression.looks(@ng_expression)
    end
  end
end
