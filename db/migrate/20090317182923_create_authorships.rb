class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.belongs_to :mod,             :null => :false
      t.belongs_to :team,             :null => :false
      t.string     :role,             :default => "author",    :limit => 15,  :null => false # author, coauthor
      t.timestamp
    end
    
    add_index :authorships, :team_id
    add_index :authorships, :mod_id
  end
  
  def self.down
    drop_table :authorships
  end
end
