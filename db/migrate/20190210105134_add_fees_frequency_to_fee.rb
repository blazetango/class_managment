class AddFeesFrequencyToFee < ActiveRecord::Migration[5.1]
  def change
	add_column :fees, :fees_frequency, :string
  end
end
