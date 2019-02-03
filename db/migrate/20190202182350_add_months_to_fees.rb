class AddMonthsToFees < ActiveRecord::Migration[5.1]
  def change
    add_reference :fees, :month, foreign_key: true
  end
end
