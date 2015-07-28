class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :nome
      t.string :descricao

      t.timestamps null: false
    end
  end
end
