class AddDurationToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :duration, :integer
  end
end
