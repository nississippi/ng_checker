class Admin::NgTaggingContentsController < ApplicationController
  before_action :authenticate_admin!

  def create
  end

  def destroy

  end

  private

  def ng_tagging_content_params
    params.require(:ng_tagging_content).permit(:ng_expression_id, :content_id)
  end
end
