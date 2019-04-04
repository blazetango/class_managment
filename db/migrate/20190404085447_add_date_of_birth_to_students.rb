class AddDateOfBirthToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :date_of_birth, :date
    add_column :students, :middle_name, :string
    add_column :students, :last_name, :string
    add_column :students, :parent_name, :string
    add_column :students, :date_of_joining, :date
    rename_column :students, :name, :first_name

  end
end
