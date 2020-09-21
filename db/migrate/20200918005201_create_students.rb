class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.text :nome
      t.text :cpf
      t.date :data_nasc
      t.integer :telefone
      t.text :genero
      t.text :meio_pagamento

      t.timestamps
    end
    add_index :students, :nome, unique: true
    add_index :students, :cpf, unique: true
  end
end
