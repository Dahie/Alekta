class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string       :nick_name,                                    :limit => 100, :null => false
      t.string       :real_name,                                    :limit => 100, :null => false
      t.string       :gender,                :default => "unknown", :limit => 15,  :null => false # unknown, male, female
      t.string       :email,                                        :limit => 100, :null => false
      t.string       :role,                  :default => "user",    :limit => 15,  :null => false # user, editor, expert, admin
      t.boolean      :anonymous,             :default => false,                    :null => false      
      t.string       :crypted_password,      :null => false
      t.string       :password_salt,         :null => false
      t.string       :persistence_token,     :null => false
      t.string       :single_access_token,   :null => false # optional, see the tokens section below.
      t.string       :perishable_token,      :null => false # optional, see the tokens section below.
      t.integer      :login_count,           :null => false, :default => 0 # optional, this is a "magic" column, see the magic columns section below
      t.datetime     :last_request_at
      t.datetime     :current_login_at
      t.datetime     :last_login_at
      t.timestamps
    end
    
    add_index :users, :email
  end
  
  def self.down
    drop_table :users
  end
end
