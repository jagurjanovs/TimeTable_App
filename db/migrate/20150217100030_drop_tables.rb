class DropTables < ActiveRecord::Migration
  def change
    drop_table :timetbales
    drop_table :module_timetables
  end
end
