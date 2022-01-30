class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :user_id
      t.datetime :deadline

      t.timestamps
    end
  end
end
