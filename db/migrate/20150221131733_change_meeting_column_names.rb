class ChangeMeetingColumnNames < ActiveRecord::Migration
  def change
    add_column :meetings, :date, :date
    change_column :meetings, :day, :start_time
    change_column :meetings, :time, :end_time
  end
end
