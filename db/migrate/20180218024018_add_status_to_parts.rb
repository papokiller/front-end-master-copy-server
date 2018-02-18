class AddStatusToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :status, :integer, default: 0
  end
end
