class Admin::ContentsController < ApplicationController
  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to admin_contents_path
    else
      render :new
    end
  end

  def index
    @media_genres = MediaGenre.all
    if params[:media_genre_id]
      @media_genre = MediaGenre.find(params[:media_genre_id])
      @contents = @media_genre.contents.page(params[:page])
    else
      @contents = Content.page(params[:page])
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to admin_contents_path
    else
      render :edit
    end
  end

  def destroy
    Content.find_by(id: params[:id]).destroy
    redirect_to admin_contents_path
  end

  private

  def content_params
    params.require(:content).permit(:title, :release_year, { media_genre_ids: [] })
  end
end
