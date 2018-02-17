class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
