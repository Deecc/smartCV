class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :name
      t.integer :rg
      t.integer :cpf
      t.references :department, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :entrada
      t.datetime :saida
      t.references :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
