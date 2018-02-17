class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.references :episode, foreign_key: true
      t.string :name
      t.string :description
      t.string :time
      t.string :link
      t.string :image
      t.boolean :download_local
      t.string :video_url

      t.timestamps
    end
  end
end
