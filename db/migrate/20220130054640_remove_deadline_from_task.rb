class RemoveDeadlineFromTask < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :deadline, :time
  end
end
