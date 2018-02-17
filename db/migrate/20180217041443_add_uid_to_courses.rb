class AddUidToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :uid, :string
  end
end
