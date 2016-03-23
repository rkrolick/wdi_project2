class FactorioMapsController < ApplicationController

  def index
    @factorio_map = FactorioMap.new
    @factorio_maps = FactorioMap.all
  end

  def show
    @factorio_map = FactorioMap.find(params[:id])
  end

  def create
    @factorio_map = FactorioMap.create!(map_params)
    @factorio_map.extract_preview_img
    redirect_to @factorio_map
  end

  def edit
    @factorio_map = FactorioMap.find(params[:id])
  end

  def update
    @factorio_map = FactorioMap.find(params[:id])
    @factorio_map.update(map_params)

    redirect_to @factorio_map
  end

  def destroy
    @factorio_map= FactorioMap.find(params[:id])
    @factorio_map.destroy
    redirect_to factorio_maps_path
  end

  private
  def map_params
    params.require(:factorio_map).permit(:name, :zip)
  end

end
