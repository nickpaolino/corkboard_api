class RemoveTypeFromMedium < ActiveRecord::Migration[5.2]
  def change
    remove_column :media, :type, :string
  end
end
