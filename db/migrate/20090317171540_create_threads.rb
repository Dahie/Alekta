class CreateThreads < ActiveRecord::Migration
  def self.up
    
    create_table :threads do |t|
      t.belongs_to :game,                :null => false
      t.belongs_to :mod
      t.belongs_to :user,                           :null => false
      t.string     :title,        :limit => 100, :null => false
      t.string     :url,          :limit => 100, :null => false
      t.string     :alias,        :limit => 100, :null => false
      t.timestamps
    end
    
    add_index :threads, :organisation_id
    add_index :threads, :url
    add_index :threads, :alias
    add_index :threads, :title
  end

  end

  def self.down
    drop_table :threads
  end
end
