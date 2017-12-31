class AddTopPositionToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :top_position, :string
  end
end
