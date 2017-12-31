class AddLeftPositionToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :left_position, :string
  end
end
