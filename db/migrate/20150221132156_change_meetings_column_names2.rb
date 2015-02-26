class ChangeMeetingsColumnNames2 < ActiveRecord::Migration
  def change
    rename_column :meetings, :day, :start_time
    rename_column :meetings, :time, :end_time
  end
end
