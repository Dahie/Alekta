class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.belongs_to  :game,                             :null => false
      t.belongs_to  :mod,                              :null => false
      t.belongs_to  :user,                             :null => false
      t.string      :title,                            :limit => 100,    :null => false
      t.string      :version,                          :limit => 100,    :null => false
      t.text        :change_log,                       :limit => 10_000
      t.string      :status,       :default => "public",     :limit => 15,     :null => false  # private, public
      t.timestamps
      
      #TODO scheduled releases
    end
    
    add_index :releases, :game_id
    add_index :releases, :mod_id
    add_index :releases, :user_id
  end

  def self.down
    drop_table :releases
  end
end
