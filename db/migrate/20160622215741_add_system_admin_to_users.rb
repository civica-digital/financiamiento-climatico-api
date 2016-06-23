class AddSystemAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :system_admin, :boolean, default: false, null: false
  end
end
