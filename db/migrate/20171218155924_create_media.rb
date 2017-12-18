class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :link
      t.string :caption
      t.string :type
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
