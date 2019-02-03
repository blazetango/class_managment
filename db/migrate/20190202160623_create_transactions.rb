class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.references :transactable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
