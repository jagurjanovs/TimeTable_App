class AddCourseCode < ActiveRecord::Migration
  def change
    add_column :users, :course_enrolled, :string
  end
end
