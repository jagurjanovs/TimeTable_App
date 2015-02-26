class EditEventsTable < ActiveRecord::Migration
  def change
    add_column :events, :created_by, :integer
    change_column :events, :start_time, :datetime
    change_column :events, :end_time, :datetime
  end
end
