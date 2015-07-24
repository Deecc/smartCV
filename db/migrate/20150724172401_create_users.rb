class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.int :rg
      t.int :cpf
      t.int :matricula
      t.references :departament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
