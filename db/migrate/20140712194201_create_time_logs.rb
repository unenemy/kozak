class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.integer :time
      t.string :title
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
