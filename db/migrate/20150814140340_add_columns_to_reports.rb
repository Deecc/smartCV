class AddColumnsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :dataInicio, :date
    add_column :reports, :dataFim, :date
  end
end
