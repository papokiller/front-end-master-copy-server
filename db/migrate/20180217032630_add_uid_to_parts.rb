class AddUidToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :uid, :string
  end
end
