class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.string :name
      t.integer :duration
      t.string :day
      t.time :timing

      t.timestamps
    end
  end
end
