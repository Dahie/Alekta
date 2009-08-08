class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.belongs_to :mod,                   :null => false
      t.belongs_to :user,                           :null => false
      t.string     :title,        :limit => 100,    :null => false
      t.text       :text,         :limit => 10_000, :null => false
      t.string     :url,          :limit => 100,    :null => false
      t.string     :alias,        :limit => 100,    :null => false
      
      t.timestamps
    end
    
    add_index :reviews, :mod_id
    add_index :reviews, :user_id
    add_index :reviews, :url
    add_index :reviews, :alias
  end
  
  def self.down
    drop_table :reviews
  end
end
