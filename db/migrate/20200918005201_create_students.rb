class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.text :name
      t.text :cpf
      t.date :birth_date
      t.integer :phone
      t.text :gender
      t.text :pay_method
      t.text :cep
      t.text :address
      t.text :state
      t.text :neighborhood
      t.text :city
      t.boolean :enabled_std, default: 'true'

      t.timestamps
    end
    add_index :students, :name, unique: true
    add_index :students, :cpf, unique: true
  end
end
