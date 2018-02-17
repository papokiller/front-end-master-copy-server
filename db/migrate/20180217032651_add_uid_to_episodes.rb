class AddUidToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :uid, :string
  end
end
