class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :summary
      t.string :name_instructor
      t.string :bio_instructor
      t.string :time_course
      t.string :link

      t.timestamps
    end
  end
end
