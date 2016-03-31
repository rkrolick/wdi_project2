class FactorioMapsController < ApplicationController
  # NHO: see similar comments re: DRY up controller code in comments controller
  # What line is repetitive in this controller?

  # NHO: recommend looking into CanCanCan for locking down the app's authorization

  def index
    @factorio_map = FactorioMap.new
    @factorio_maps = FactorioMap.all
  end

  def show
    @factorio_map = FactorioMap.find(params[:id])
  end

  def create
    @factorio_map = FactorioMap.create!(map_params)
    @factorio_map.extract_preview_img # NHO: this method causes production errors if zip does not contain "preview url"
    redirect_to @factorio_map
  end

  def edit
    # NHO: how you could fake some authorization code here?
    @factorio_map = FactorioMap.find(params[:id])
  end

  def update
    # NHO: how you could fake some authorization code here?
    @factorio_map = FactorioMap.find(params[:id])
    @factorio_map.update(map_params)

    redirect_to @factorio_map
  end

  def destroy
    # NHO: how you could fake some authorization code here?
    @factorio_map= FactorioMap.find(params[:id])
    @factorio_map.destroy
    redirect_to factorio_maps_path
  end

  private
  def map_params
    params.require(:factorio_map).permit(:name, :zip)
  end

end
