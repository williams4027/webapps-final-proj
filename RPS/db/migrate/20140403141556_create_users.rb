class CreateUsers < ActiveRecord::Migration
  def up
    create_table  :users do |t|
    t.column "user_name", :string, :null => false, :limit => 25
    t.string "password", :null => false, :limit => 25
    t.integer "wins"
    t.integer "loses"
    t.integer "ties"
    t.datetime "create_at"
    end
    #execute "ALTER TABLE users ADD PRIMARY KEY (user_name);"
  end

  def down
    drop_table :users
  end
end
