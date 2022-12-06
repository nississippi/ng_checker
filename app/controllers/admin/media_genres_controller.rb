class Admin::MediaGenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @media = MediaGenre.new
    @medias = MediaGenre.all
  end

  def create
    @media = MediaGenre.new(media_params)
    if @media.save
      redirect_to admin_media_genres_path
    else
      @medias = MediaGenre.all
      render :index
    end
  end

  def show
    @media = MediaGenre.find(params[:id])
  end

  def edit
    @media = MediaGenre.find(params[:id])
  end

  def update
    @media = MediaGenre.find(params[:id])
    @media.update(media_params) ? (redirect_to admin_media_genres_path) : (render :edit)
  end

  def destroy
    MediaGenre.find_by(id: params[:id]).destroy
    redirect_to admin_media_genres_path
  end

  private

  def media_params
    params.require(:media_genre).permit(:media)
  end
end
