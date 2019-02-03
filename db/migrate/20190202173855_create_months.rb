class CreateMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :months do |t|
      t.string :name

      t.timestamps
    end
    add_months
  end

  def add_months
		['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].each do |f|
		 Month.create!(name: f)
		end
  end
 end