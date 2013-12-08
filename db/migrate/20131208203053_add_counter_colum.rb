class AddCounterColum < ActiveRecord::Migration
  def change
        add_column :calculations, :counter, :integer, :default => 0
        remove_column :calculations, :count
  end
end
