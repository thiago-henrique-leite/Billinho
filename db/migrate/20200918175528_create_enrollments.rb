class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.decimal :total_value
      t.integer :ammount_bills
      t.integer :due_day
      t.text :course
      t.belongs_to :institution
      t.belongs_to :student

      t.timestamps
    end
  end
end
