class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nome
      t.string :telefone
      t.string :cnpj
      t.string :endereco
      t.integer :numero
      t.string :complemento
      t.integer :cep
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps null: false
    end
  end
end
