class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.belongs_to  :game,                              :null => false
      t.belongs_to  :user,                                      :null => false
      t.string      :title,                   :limit => 100,    :null => false
      t.string      :attachment_file_name
      t.string      :attachment_content_type
      t.integer     :attachment_file_size
      t.datetime    :attachment_updated_at
      t.timestamps
    end
    
    add_index :media, :game_id
    add_index :media, :user_id
  end

  def self.down
    drop_table :media
  end
end
