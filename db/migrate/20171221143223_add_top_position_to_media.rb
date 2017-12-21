class AddTopPositionToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :top_position, :string
  end
end
