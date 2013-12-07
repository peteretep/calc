class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.string :operation

      t.timestamps
    end
  end
end
