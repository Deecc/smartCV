class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.integer :matricula
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
