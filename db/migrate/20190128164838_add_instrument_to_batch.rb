class AddInstrumentToBatch < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :instrument_id, :integer
  end
end
