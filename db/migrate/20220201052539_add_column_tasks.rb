class AddColumnTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :is_finished, :boolean
  end
end
