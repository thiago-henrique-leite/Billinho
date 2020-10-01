class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.text :name
      t.text :cpf
      t.date :birth_date
      t.integer :phone
      t.text :gender
      t.text :pay_method

      t.timestamps
    end
    add_index :students, :name, unique: true
    add_index :students, :cpf, unique: true
  end
end
