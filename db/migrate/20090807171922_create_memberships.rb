class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.belongs_to :team, :null => false
      t.belongs_to :user,  :null => false
      t.timestamps
    end
    
    add_index :memberships, :team_id
    add_index :memberships, :user_id
  end
  
  def self.down
    drop_table :memberships
  end
end
