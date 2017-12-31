class AddTopPositionToBoardUser < ActiveRecord::Migration[5.2]
  def change
    add_column :board_users, :top_position, :string
  end
end
