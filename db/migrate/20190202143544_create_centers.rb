class CreateCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :centers do |t|
      t.string :address
      t.string :name
      t.float :budget

      t.timestamps
    end
  end
end
