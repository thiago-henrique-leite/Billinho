class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.decimal :valor_fatura
      t.date :data_vencimento
      t.belongs_to :enrollment
      t.text :status
      t.belongs_to :student

      t.timestamps
    end
  end
end
