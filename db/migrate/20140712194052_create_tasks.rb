class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :title
      t.integer :estimated_time
      t.datetime :deadline
      t.text :description

      t.timestamps
    end
  end
end
