class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.references :factorio_map, index: true, foreign_key: true
    end
  end
end
