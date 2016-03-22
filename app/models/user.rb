class User < ActiveRecord::Base
  has_many :factorio_maps
  has_many :comments
end
