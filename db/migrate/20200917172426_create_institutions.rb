class CreateInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :institutions do |t|
      t.text :name
      t.text :cnpj
      t.text :kind
      t.text :cep
      t.text :address
      t.text :state
      t.text :neighborhood
      t.text :city

      t.timestamps
    end
    add_index :institutions, :name, unique: true
    add_index :institutions, :cnpj, unique: true
  end
end
