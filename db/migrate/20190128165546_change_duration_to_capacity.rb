class ChangeDurationToCapacity < ActiveRecord::Migration[5.1]
  def change
  	rename_column :batches, :duration, :capacity
  end
end
