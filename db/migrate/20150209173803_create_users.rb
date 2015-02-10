class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email, unique:true
      t.text :password_digest
      t.boolean :email_confirmed
      t.string :remember_token
      t.string :password_reset_token
      t.datetime :password_sent_at

      t.timestamps
    end
  end
end
