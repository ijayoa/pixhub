class AddUniqueToFields < ActiveRecord::Migration
  def change
  	 add_index "users", ["email"], name: "index_users_on_email", unique: true
     add_index "users", ["username"], name: "index_users_on_username", unique: true
  end
end
