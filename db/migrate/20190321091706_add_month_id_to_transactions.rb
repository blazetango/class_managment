class AddMonthIdToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :month_id, :integer
  end
end
