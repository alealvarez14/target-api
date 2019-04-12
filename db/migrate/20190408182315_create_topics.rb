class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :icon

      t.timestamps
    end
  end
end
