class CreateInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :institutions do |t|
      t.text :nome
      t.text :cnpj
      t.text :tipo

      t.timestamps
    end
    add_index :institutions, :nome, unique: true
    add_index :institutions, :cnpj, unique: true
  end
end
