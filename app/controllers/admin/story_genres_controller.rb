class Admin::StoryGenresController < ApplicationController
  def index
    @story = StoryGenre.new
    @stories = StoryGenre.all
  end

  def create
    @story = StoryGenre.new(story_params)
    if @story.save
      redirect_to admin_story_genres_path
    else
      @stories = StoryGenre.all
      render :index
    end
  end

  def show
    @story = StoryGenre.find(params[:id])
  end

  def edit
    @story = StoryGenre.find(params[:id])
  end

  def update
    @story = StoryGenre.find(params[:id])
    @story.update(story_params) ? (redirect_to admin_stories_path) : (render :edit)
  end

  def destroy
    StoryGenre.find_by(id: params[:id]).destroy
    redirect_to admin_story_genres_path
  end

  private

  def story_params
    params.require(:story_genre).permit(:story)
  end
end
