class AddBoardIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :board_id, :integer
  end
end
