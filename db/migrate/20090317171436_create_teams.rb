class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string      :name,         :limit => 100,    :null => false
      t.text        :description,  :limit => 10_000, :null => false
      t.string      :website_url,      :limit => 100,    :null => false
      t.string      :email,        :limit => 100,    :null => false
      t.string      :status,        :default => "accepted",    :limit => 15,  :null => false # pending, accepted, rejected
      t.belongs_to :user,                           :null => false
      t.timestamps
    end
    
  end
  
  def self.down
    drop_table :teams
  end
end
