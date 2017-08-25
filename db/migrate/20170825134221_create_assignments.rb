class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :project
      t.float :allocation_percentage
      t.string :project_frequency
      t.datetime :start_date
      t.datetime :end_date
      t.integer :employee_id
      t.integer :user_id

      t.timestamps
    end
  end
end
