class AddVideoUrlLocalToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :video_url_local, :string
  end
end
