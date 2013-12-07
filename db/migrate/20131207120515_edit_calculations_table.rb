class EditCalculationsTable < ActiveRecord::Migration
  def change
    add_column :calculations, :a, :integer
    add_column :calculations, :b, :integer
  end
end
