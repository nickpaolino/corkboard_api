class AddLeftPositionToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :left_position, :string
  end
end
