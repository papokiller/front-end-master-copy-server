class CreateUploaders < ActiveRecord::Migration[5.1]
  def change
    create_table :uploaders do |t|
      t.json :data
      t.string :service
      t.string :username
      t.string :password
      t.string :access_token

      t.timestamps
    end
  end
end
