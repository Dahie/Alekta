class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string     :name,     :limit => 100, :null => false
      t.string     :alias,    :limit => 100, :null => false
      t.string     :company_name,    :limit => 100, :null => false
      t.string     :website_url,      :limit => 100, :null => false
      t.timestamps
    end
    
    add_index :games, :name
  end
  
  def self.down
    drop_table :games
  end
end
