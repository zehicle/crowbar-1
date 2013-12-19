# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131218165924) do

  create_table "allocations", :force => true do |t|
    t.integer  "node_id"
    t.integer  "range_id"
    t.string   "address",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "allocations", ["address"], :name => "index_allocations_on_address", :unique => true

  create_table "attribs", :force => true do |t|
    t.integer  "barclamp_id"
    t.integer  "role_id"
    t.string   "type"
    t.string   "name",                           :null => false
    t.string   "description"
    t.integer  "order",       :default => 10000
    t.string   "map"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "attribs", ["name"], :name => "index_attribs_on_name", :unique => true

  create_table "barclamps", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "description"
    t.integer  "barclamp_id"
    t.integer  "version"
    t.string   "source_path"
    t.string   "commit",      :default => "unknown"
    t.datetime "build_on",    :default => '2013-12-19 04:40:23'
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "barclamps", ["name"], :name => "index_barclamps_on_name", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deployment_roles", :force => true do |t|
    t.integer  "snapshot_id", :null => false
    t.integer  "role_id",     :null => false
    t.text     "data"
    t.text     "wall"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "deployment_roles", ["snapshot_id", "role_id"], :name => "index_deployment_roles_on_snapshot_id_and_role_id", :unique => true

  create_table "deployments", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "description"
    t.boolean  "system",      :default => false, :null => false
    t.integer  "snapshot_id"
    t.integer  "parent_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "deployments", ["name"], :name => "index_deployments_on_name", :unique => true

  create_table "docs", :force => true do |t|
    t.text     "name"
    t.integer  "barclamp_id"
    t.text     "description"
    t.integer  "parent_id"
    t.string   "order",       :default => "009999"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "docs", ["name"], :name => "index_docs_on_name", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category",    :default => "ui"
    t.integer  "order",       :default => 10000
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "groups", ["category", "name"], :name => "index_groups_on_category_and_name", :unique => true

  create_table "jigs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "order",            :default => 10000
    t.string   "type",                                :null => false
    t.boolean  "active",           :default => false
    t.string   "client_role_name"
    t.string   "server"
    t.string   "client_name"
    t.text     "key"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "jigs", ["name"], :name => "index_jigs_on_name", :unique => true

  create_table "navs", :id => false, :force => true do |t|
    t.string   "item"
    t.string   "parent_item", :default => "root"
    t.string   "name"
    t.string   "description"
    t.string   "path"
    t.integer  "order",       :default => 9999
    t.boolean  "development", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "networks", :force => true do |t|
    t.integer  "deployment_id"
    t.string   "name",                             :null => false
    t.string   "description"
    t.integer  "order",         :default => 1000,  :null => false
    t.integer  "vlan",          :default => 0,     :null => false
    t.boolean  "use_vlan",      :default => false, :null => false
    t.boolean  "use_bridge",    :default => false, :null => false
    t.integer  "team_mode",     :default => 5,     :null => false
    t.boolean  "use_team",      :default => false, :null => false
    t.string   "v6prefix"
    t.string   "conduit",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "networks", ["name"], :name => "index_networks_on_name", :unique => true

  create_table "node_groups", :id => false, :force => true do |t|
    t.integer "node_id"
    t.integer "group_id"
  end

  add_index "node_groups", ["node_id", "group_id"], :name => "index_node_groups_on_node_id_and_group_id", :unique => true

  create_table "node_role_pcms", :id => false, :force => true do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

  create_table "node_roles", :force => true do |t|
    t.integer  "snapshot_id",                     :null => false
    t.integer  "role_id",                         :null => false
    t.integer  "node_id",                         :null => false
    t.integer  "state",       :default => 4,      :null => false
    t.integer  "cohort",      :default => 0,      :null => false
    t.integer  "run_count",   :default => 0,      :null => false
    t.string   "status"
    t.text     "userdata",    :default => "{}",   :null => false
    t.text     "systemdata",  :default => "{}",   :null => false
    t.text     "wall"
    t.text     "runlog",      :default => "",     :null => false
    t.boolean  "available",   :default => true,   :null => false
    t.integer  "order",       :default => 424880
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "node_roles", ["snapshot_id", "role_id", "node_id"], :name => "index_node_roles_on_snapshot_id_and_role_id_and_node_id", :unique => true

  create_table "nodes", :force => true do |t|
    t.string   "name",                                                      :null => false
    t.string   "alias",          :limit => 100,                             :null => false
    t.string   "description"
    t.integer  "order",                         :default => 10000
    t.boolean  "admin",                         :default => false
    t.integer  "target_role_id"
    t.integer  "deployment_id"
    t.text     "discovery",                     :default => "{}",           :null => false
    t.text     "hint",                          :default => "{}",           :null => false
    t.boolean  "allocated",                     :default => false
    t.boolean  "alive",                         :default => false,          :null => false
    t.boolean  "available",                     :default => true,           :null => false
    t.string   "bootenv",                       :default => "sledgehammer", :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "nodes", ["name"], :name => "index_nodes_on_name", :unique => true

  create_table "ranges", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "network_id"
    t.string   "first",      :null => false
    t.string   "last",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ranges", ["name", "network_id"], :name => "index_ranges_on_name_and_network_id", :unique => true

  create_table "role_require_attribs", :force => true do |t|
    t.integer  "role_id"
    t.string   "attrib_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "role_require_attribs", ["role_id", "attrib_name"], :name => "index_role_require_attribs_on_role_id_and_attrib_name", :unique => true

  create_table "role_requires", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.string   "requires",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "role_requires", ["requires"], :name => "index_role_requires_on_requires"
  add_index "role_requires", ["role_id", "requires"], :name => "index_role_requires_on_role_id_and_requires", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "description"
    t.string   "type"
    t.text     "template",    :default => "{}",  :null => false
    t.string   "jig_name",                       :null => false
    t.boolean  "library",     :default => false, :null => false
    t.boolean  "implicit",    :default => false, :null => false
    t.boolean  "bootstrap",   :default => false, :null => false
    t.boolean  "discovery",   :default => false, :null => false
    t.boolean  "server",      :default => false, :null => false
    t.boolean  "cluster",     :default => false, :null => false
    t.boolean  "destructive", :default => false, :null => false
    t.integer  "barclamp_id",                    :null => false
    t.integer  "cohort"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "roles", ["barclamp_id", "name"], :name => "index_roles_on_barclamp_id_and_name", :unique => true

  create_table "routers", :force => true do |t|
    t.integer  "network_id"
    t.string   "address",                       :null => false
    t.integer  "pref",       :default => 65536, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "runs", :force => true do |t|
    t.integer "node_role_id",                    :null => false
    t.integer "node_id",                         :null => false
    t.boolean "running",      :default => false, :null => false
  end

  add_index "runs", ["node_id"], :name => "index_runs_on_node_id"
  add_index "runs", ["node_role_id"], :name => "index_runs_on_node_role_id"
  add_index "runs", ["running"], :name => "index_runs_on_running"

  create_table "settings", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "snapshots", :force => true do |t|
    t.integer  "state",         :default => 0,    :null => false
    t.string   "name",                            :null => false
    t.string   "description"
    t.integer  "order",         :default => 1000, :null => false
    t.integer  "deployment_id",                   :null => false
    t.integer  "snapshot_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "username",               :default => "",    :null => false
    t.boolean  "is_admin",               :default => false, :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
