class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string      :name,                                 :limit => 100,    :null => false
      t.text        :description,                          :limit => 10_000, :null => false
      t.string      :type,         :default => "Category", :limit => 25,     :null => false # Faculty, Position, Location, Topic
      t.timestamps
    end
    
    add_index :categories, [:id, :type]
    add_index :categories, :type
  end
  
  def self.down
     drop_table :categories
  end
end
