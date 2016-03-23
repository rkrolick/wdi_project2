class AddImgUrlToFactorioMap < ActiveRecord::Migration
  def change
    add_column :factorio_maps, :img_url, :string
    add_index :factorio_maps, :img_url
  end
end
