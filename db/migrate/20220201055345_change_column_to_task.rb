class ChangeColumnToTask < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :is_finished, :boolean, null: false, default: false
  end
end
