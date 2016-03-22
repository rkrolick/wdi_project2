class AddAttachmentZipToFactorioMaps < ActiveRecord::Migration
  def self.up
    change_table :factorio_maps do |t|
      t.attachment :zip
    end
  end

  def self.down
    remove_attachment :factorio_maps, :zip
  end
end
