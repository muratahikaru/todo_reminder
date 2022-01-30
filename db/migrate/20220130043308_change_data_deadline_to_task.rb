class ChangeDataDeadlineToTask < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :deadline, :time
  end
end
