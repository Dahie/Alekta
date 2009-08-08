class CreateMods < ActiveRecord::Migration
  def self.up
    create_table :mods do |t|
      t.belongs_to :game,                                           :null => false
      #t.belongs_to :genre,                                          :null => false
      t.string     :title,                                       :limit => 100,    :null => false
      t.text       :short_description,                                 :limit => 200, :null => false
      t.text       :description,                                 :limit => 10_000, :null => false
      t.text       :credits,                                     :limit => 10_000, :null => false
      t.text       :website_url,                                     :limit => 10_000, :null => false
      #t.string     :origin,                :default => "unknown",    :limit => 15,  :null => false # unknown, scratch, conversion, hybrid
      t.string     :addon_type,                  :default => "misc",    :limit => 15,  :null => false # misc, cars, tracks, tools
      t.string      :status,        :default => "accepted",    :limit => 15,  :null => false # pending, accepted, rejected
      
      t.timestamps
    end
    
    add_index :mods, :game_id
    #add_index :mods, :genre_id
  end
  
  def self.down
    drop_table :mod
  end
end
