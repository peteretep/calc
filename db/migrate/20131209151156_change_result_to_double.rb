class ChangeResultToDouble < ActiveRecord::Migration
  def change
    change_column :calculations, :result, :decimal
  end
end
