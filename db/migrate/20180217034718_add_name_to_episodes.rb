class AddNameToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :name, :string
  end
end
