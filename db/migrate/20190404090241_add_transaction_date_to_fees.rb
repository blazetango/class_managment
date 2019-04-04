class AddTransactionDateToFees < ActiveRecord::Migration[5.1]
  def change
    add_column :fees, :transaction_date, :date
  end
end
