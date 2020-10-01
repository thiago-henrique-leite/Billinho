class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.decimal :bill_amount
      t.date :due_date
      t.belongs_to :enrollment
      t.text :status
      t.belongs_to :student

      t.timestamps
    end
  end
end
