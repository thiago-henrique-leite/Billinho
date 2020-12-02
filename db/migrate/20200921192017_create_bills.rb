class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.decimal :bill_value
      t.date :due_date
      t.text :status
      t.boolean :enabled_bill, default: 'true'
      t.decimal :paid_value
      t.belongs_to :student
      t.belongs_to :enrollment
      t.belongs_to :institution

      t.timestamps
    end
  end
end
