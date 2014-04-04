class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    t.column "move", :string, :null => false,:limit => 8
    t.string "game_creator", :null => false, :limit => 25
    t.boolean "open"
    t.datetime "created_at"
    t.timestamps "game_over"
    end
  end

  def down
    drop_table :games
  end
end
