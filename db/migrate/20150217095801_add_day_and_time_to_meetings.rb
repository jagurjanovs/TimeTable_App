class AddDayAndTimeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :day, :integer
    add_column :meetings, :time, :integer
  end
end
