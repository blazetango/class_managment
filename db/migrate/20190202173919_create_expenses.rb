class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :name
      t.references :month, foreign_key: true

      t.timestamps
    end
  end
end
