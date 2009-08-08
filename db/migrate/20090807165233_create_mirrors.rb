class CreateMirrors < ActiveRecord::Migration
  def self.up
     create_table :mirrors do |t|
      t.belongs_to  :user,                             :null => false
      t.belongs_to  :release,                             :null => false
      t.string      :title,                            :limit => 100,    :null => false
      t.string      :download_url,                     :limit => 100,    :null => false
      t.string      :status,       :default => "public",     :limit => 15,     :null => false  # public, private
      t.string      :attachment_file_name
      t.string      :attachment_content_type
      t.integer     :attachment_file_size
      t.datetime    :attachment_updated_at
      t.timestamps
    end
    
    add_index :mirrors, :user_id
    add_index :mirrors, :release_id
  end

  def self.down
    drop_table :mirrors
  end
end
