# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090808071314) do

  create_table "authorships", :force => true do |t|
    t.integer "mod_id"
    t.integer "team_id"
    t.string  "role",    :limit => 15, :default => "author", :null => false
  end

  add_index "authorships", ["mod_id"], :name => "index_authorships_on_mod_id"
  add_index "authorships", ["team_id"], :name => "index_authorships_on_team_id"

  create_table "categories", :force => true do |t|
    t.string   "name",        :limit => 100,                           :null => false
    t.text     "description", :limit => 10000,                         :null => false
    t.string   "type",        :limit => 25,    :default => "Category", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["id", "type"], :name => "index_categories_on_id_and_type"
  add_index "categories", ["type"], :name => "index_categories_on_type"

  create_table "comments", :force => true do |t|
    t.integer  "game_id",                                            :null => false
    t.integer  "thread_id",                                          :null => false
    t.integer  "user_id",                                            :null => false
    t.text     "text",       :limit => 10000,                        :null => false
    t.string   "type",       :limit => 25,    :default => "Comment", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["id", "type"], :name => "index_comments_on_id_and_type"
  add_index "comments", ["thread_id"], :name => "index_comments_on_thread_id"
  add_index "comments", ["type"], :name => "index_comments_on_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "games", :force => true do |t|
    t.string   "name",         :limit => 100, :null => false
    t.string   "alias",        :limit => 100, :null => false
    t.string   "company_name", :limit => 100, :null => false
    t.string   "website_url",  :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["name"], :name => "index_games_on_name"

  create_table "memberships", :force => true do |t|
    t.integer  "team_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["team_id"], :name => "index_memberships_on_team_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "mirrors", :force => true do |t|
    t.integer  "user_id",                                                      :null => false
    t.integer  "release_id",                                                   :null => false
    t.string   "title",                   :limit => 100,                       :null => false
    t.integer  "clicks",                  :limit => 100,                       :null => false
    t.string   "download_url",            :limit => 100,                       :null => false
    t.string   "status",                  :limit => 15,  :default => "public", :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mirrors", ["release_id"], :name => "index_mirrors_on_release_id"
  add_index "mirrors", ["user_id"], :name => "index_mirrors_on_user_id"

  create_table "mods", :force => true do |t|
    t.integer  "game_id",                                                    :null => false
    t.integer  "team_id",                                                    :null => false
    t.integer  "original_id"
    t.string   "title",             :limit => 100,                           :null => false
    t.text     "short_description", :limit => 200,                           :null => false
    t.text     "description",       :limit => 10000,                         :null => false
    t.text     "credits",           :limit => 10000,                         :null => false
    t.text     "website_url",       :limit => 10000,                         :null => false
    t.string   "addon_type",        :limit => 15,    :default => "misc",     :null => false
    t.string   "status",            :limit => 15,    :default => "accepted", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mods", ["game_id"], :name => "index_mods_on_game_id"

  create_table "releases", :force => true do |t|
    t.integer  "mod_id",                                            :null => false
    t.integer  "user_id",                                           :null => false
    t.string   "title",      :limit => 100,                         :null => false
    t.string   "version",    :limit => 100,                         :null => false
    t.text     "change_log", :limit => 10000
    t.string   "status",     :limit => 15,    :default => "public", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "releases", ["mod_id"], :name => "index_releases_on_mod_id"
  add_index "releases", ["user_id"], :name => "index_releases_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "mod_id",                      :null => false
    t.integer  "user_id",                     :null => false
    t.string   "title",      :limit => 100,   :null => false
    t.text     "text",       :limit => 10000, :null => false
    t.string   "url",        :limit => 100,   :null => false
    t.string   "alias",      :limit => 100,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["alias"], :name => "index_reviews_on_alias"
  add_index "reviews", ["mod_id"], :name => "index_reviews_on_mod_id"
  add_index "reviews", ["url"], :name => "index_reviews_on_url"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "teams", :force => true do |t|
    t.string   "name",        :limit => 100,                           :null => false
    t.text     "description", :limit => 10000,                         :null => false
    t.string   "website_url", :limit => 100,                           :null => false
    t.string   "email",       :limit => 100,                           :null => false
    t.string   "status",      :limit => 15,    :default => "accepted", :null => false
    t.integer  "user_id",                                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "threads", :force => true do |t|
    t.integer  "game_id",                   :null => false
    t.integer  "mod_id"
    t.integer  "user_id",                   :null => false
    t.string   "title",      :limit => 100, :null => false
    t.string   "review_url", :limit => 100, :null => false
    t.string   "alias",      :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "threads", ["alias"], :name => "index_threads_on_alias"
  add_index "threads", ["review_url"], :name => "index_threads_on_review_url"
  add_index "threads", ["title"], :name => "index_threads_on_title"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "nick_name",           :limit => 100,                        :null => false
    t.string   "real_name",           :limit => 100,                        :null => false
    t.string   "gender",              :limit => 15,  :default => "unknown", :null => false
    t.string   "email",               :limit => 100,                        :null => false
    t.string   "role",                :limit => 15,  :default => "user",    :null => false
    t.boolean  "anonymous",                          :default => false,     :null => false
    t.string   "crypted_password",                                          :null => false
    t.string   "password_salt",                                             :null => false
    t.string   "persistence_token",                                         :null => false
    t.string   "single_access_token",                                       :null => false
    t.string   "perishable_token",                                          :null => false
    t.integer  "login_count",                        :default => 0,         :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
