class AddCountColumn < ActiveRecord::Migration
  def change
        add_column :calculations, :count, :integer
  end
end
