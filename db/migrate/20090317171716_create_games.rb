class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.belongs_to :media,                                          :null => false
      t.string     :name,     :limit => 100, :null => false
      t.string     :alias,    :limit => 100, :null => false
      t.string     :url,      :limit => 100, :null => false
      t.timestamps
    end
    
    add_index :games, :name
  end
  
  def self.down
    drop_table :games
  end
end
