class RenameOperationColAddResultCol < ActiveRecord::Migration
  def change
    rename_column :calculations, :operation, :result
    add_column :calculations, :operation, :string
  end
end
