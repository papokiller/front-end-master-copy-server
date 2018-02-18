class CreateUploaderFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :uploader_files do |t|
      t.references :part, foreign_key: true
      t.json :data
      t.references :uploader, foreign_key: true

      t.timestamps
    end
  end
end
