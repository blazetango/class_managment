class AddStudentToBatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :batch, foreign_key: true
  end
end
