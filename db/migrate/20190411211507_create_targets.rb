class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :title, null: false
      t.float :lat, null: false
      t.float :long, null: false
      t.float :radius, null: false
      t.references :topic, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
