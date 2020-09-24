class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.decimal :valor_total
      t.integer :quant_faturas
      t.integer :dia_vencimento
      t.text :curso
      t.belongs_to :institution
      t.belongs_to :student

      t.timestamps
    end
  end
end
