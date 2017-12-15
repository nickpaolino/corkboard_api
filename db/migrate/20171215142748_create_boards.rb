class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :subject
      t.boolean :public

      t.timestamps
    end
  end
end
