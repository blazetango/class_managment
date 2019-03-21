class AddCenterIdToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :center_id, :integer
  end
end
