class AddEventsTable < ActiveRecord::Migration
  def change

    create_table :events do |t|
      t.string   "description"
      t.date     "date"
      t.time     "start_time"
      t.time     "end_time"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.timestamps
    end

  end
end
