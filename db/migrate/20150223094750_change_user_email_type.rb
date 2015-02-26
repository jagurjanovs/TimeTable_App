class ChangeUserEmailType < ActiveRecord::Migration
  def change
    change_column :users, :email , :integer
  end
end
