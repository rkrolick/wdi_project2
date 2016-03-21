class FactorioMapsController < ApplicationController

  def index
    @factorio_map = FactorioMap.new
    @factorio_maps = FactorioMap.all
  end

  def create
    @factorio_map = FactorioMap.create!(map_params)
    redirect_to @factorio_map
  end

  def show
    @factorio_map = FactorioMap.find(params[:id])
  end

  private
  def map_params
    params.require(:factorio_map).permit(:name)
  end

end
