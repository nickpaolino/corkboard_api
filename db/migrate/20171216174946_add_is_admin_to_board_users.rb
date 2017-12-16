class AddIsAdminToBoardUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :board_users, :is_admin, :boolean
  end
end
