class CommentsController < ApplicationController

  def new
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = @factorio_map.comments.new
  end

  def create
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = @factorio_map.comments.create!(comment_params)
    redirect_to @factorio_map
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
