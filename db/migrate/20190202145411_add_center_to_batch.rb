class AddCenterToBatch < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :center_id, :integer
  end
end
