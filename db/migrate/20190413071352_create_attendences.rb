class CreateAttendences < ActiveRecord::Migration[5.1]
  def change
    create_table :attendences do |t|
      t.date :session_date
      t.integer :batch_id
      t.integer :student_id
      t.string :remarks
      t.boolean :attend

      t.timestamps
    end
  end
end
