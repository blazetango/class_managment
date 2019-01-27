class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.float :amount
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
