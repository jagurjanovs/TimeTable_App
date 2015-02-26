class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :group_involved
      t.string :meeting_name
      t.string :agenda
      t.integer :meeting_created_by
      t.integer :memberID1
      t.integer :memberID2
      t.integer :memberID3
      t.integer :memberID4
      t.integer :memberID5
      t.integer :memberID6

      t.timestamps
    end
  end
end
