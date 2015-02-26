class ChangeMeetingColumnType < ActiveRecord::Migration
  def change
    change_column :meetings, :start_time, :datetime
    change_column :meetings, :end_time, :datetime
  end
end
