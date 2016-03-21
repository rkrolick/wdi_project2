class FactorioMapsController < ApplicationController

  def index
    @maps = FactorioMap.all
  end

  
end
