class Admin::ContentsController < ApplicationController
  before_action :authenticate_admin!
  
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
    @story_genres = StoryGenre.all
    @media_genres = MediaGenre.all
    if params[:story_genre_id] && params[:media_genre_id]
      @story_genre = StoryGenre.find(params[:story_genre_id])
      @media_genre = MediaGenre.find(params[:media_genre_id])
      @contents = @story_genre.contents.where(media_genre_id: @media_genre.id).page(params[:page])
    elsif params[:story_genre_id]
      @story_genre = StoryGenre.find(params[:story_genre_id])
      @contents = @story_genre.contents.page(params[:page])
    elsif params[:media_genre_id]
      @media_genre = MediaGenre.find(params[:media_genre_id])
      @contents = @media_genre.contents.page(params[:page])
    else
      @contents = Content.page(params[:page])
    end

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

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to admin_content_path(@content)
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
    params.require(:content).permit(:title, :release_year, { media_genre_ids: [] }, { story_genre_ids: [] })
  end
end
