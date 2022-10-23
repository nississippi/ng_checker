class Admin::NgGenresController < ApplicationController
  def index
    @ng_genre = NgGenre.new
    @ng_genres = NgGenre.all
  end

  def create
    @ng_genre = NgGenre.new(ng_genre_params)
    if @ng_genre.save
      redirect_to admin_ng_genres_path
    else
      @ng_genres = NgGenre.all
      render :index
    end
  end

  def show
    @ng_genre = NgGenre.find(params[:id])
  end

  def edit
    @ng_genre = NgGenre.find(params[:id])
  end

  def update
    @ng_genre = NgGenre.find(params[:id])
    @ng_genre.update(ng_genre_params) ? (redirect_to admin_ng_genres_path) : (render :edit)
  end

  def destroy
    NgGenre.find_by(id: params[:id]).destroy
    redirect_to admin_ng_genres_path
  end

  private

  def ng_genre_params
    params.require(:ng_genre).permit(:ng_genre)
  end
end
