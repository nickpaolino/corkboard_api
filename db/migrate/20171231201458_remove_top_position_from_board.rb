class RemoveTopPositionFromBoard < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :top_position, :string
  end
end
