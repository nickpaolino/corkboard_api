class AddLeftPositionToBoardUser < ActiveRecord::Migration[5.2]
  def change
    add_column :board_users, :left_position, :string
  end
end
