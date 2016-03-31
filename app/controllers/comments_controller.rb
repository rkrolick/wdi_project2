class CommentsController < ApplicationController
  # NHO: One common practice is to abstract all the times you "find" a resource into a method
   # that is run before a controller action. i.e:
   # before_action :find_map
   # of course you would have to define `find_map` in this example

   # NHO: Right now, we are hiding the ability to comment without registering, by using logic in the views
   # to obscure the "new_comment" link. However there is still the ability to comment by hitting the url manually:
   # i.e. http://factorio-map-share.herokuapp.com/factorio_maps/14/comments/new

  # Devise comes included with a useful method called: `authenticate_user!` that we run as a before_action on a controller like:
  # before_action :authenticate_user!
  
  def new
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = @factorio_map.comments.new
  end

  def create
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = @factorio_map.comments.create!(comment_params)
    redirect_to @factorio_map
  end

  def edit
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = Comment.find(params[:id])
    @comment.update!(comment_params)
    redirect_to @factorio_map
  end

  def destroy
    @factorio_map = FactorioMap.find(params[:factorio_map_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @factorio_map
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
