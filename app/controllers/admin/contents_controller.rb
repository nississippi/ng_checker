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
    #時間できたら絞り込み機能つける
    @contents = Content.page(params[:page])
    @all_contents_count = @contents.count
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
    params.require(:content).permit(:title, :release_year)
  end
end
