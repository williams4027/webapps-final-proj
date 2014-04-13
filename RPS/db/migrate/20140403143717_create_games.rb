class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    t.column "move", :string, :limit => 8, :null => false
    t.integer "game_creator", :null => false
    t.boolean "open"
    t.datetime "created_at"
    t.timestamps "game_over"
    end
  end

  def down
    drop_table :games
  end
end
