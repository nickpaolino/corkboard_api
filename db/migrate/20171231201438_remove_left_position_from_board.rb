class RemoveLeftPositionFromBoard < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :left_position, :string
  end
end
