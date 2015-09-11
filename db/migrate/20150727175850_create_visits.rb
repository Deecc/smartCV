class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.datetime :entrada
      t.datetime :saida
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      

      t.timestamps null: false
    end
  end
end
