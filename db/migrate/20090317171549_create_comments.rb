class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :game,                                                  :null => false
      t.belongs_to :thread,                                                :null => false
      t.belongs_to :user,                                                  :null => false
      t.text       :text,                                :limit => 10_000, :null => false
      t.string     :type,         :default => "Comment", :limit => 25,     :null => false # Comment, SystemComment, InternalSystemComment
      t.timestamps
    end
    
    add_index :comments, :thread_id
    add_index :comments, :user_id
    add_index :comments, [:id, :type]
    add_index :comments, :type
  end
  
  def self.down
    drop_table :comments
  end
end

