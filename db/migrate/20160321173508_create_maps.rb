class CreateMaps < ActiveRecord::Migration
  def change
    create_table :factorio_maps do |t|
      t.string :name
    end
  end
end
