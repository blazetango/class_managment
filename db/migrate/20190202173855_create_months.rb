class CreateMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :months do |t|
      t.string :name

      t.timestamps
    end
    add_months
  end

  def add_months
		['January 2018', 'February 2018', 'March 2018',
     'April 2018', 'May 2018', 'June 2018', 'July 2018',
     'August 2018', 'September 2018', 'October 2018',
     'November 2018', 'December 2018',
     'January 2019', 'February 2019', 'March 2019',
     'April 2019', 'May 2019', 'June 2019', 'July 2019',
     'August 2019', 'September 2019', 'October 2019',
     'November 2019', 'December 2019',
     'January 2020', 'February 2020', 'March 2020',
     'April 2020', 'May 2020', 'June 2020', 'July 2020',
     'August 2020', 'September 2020', 'October 2020',
     'November 2020', 'December 2020'].each do |f|
		 Month.create!(name: f)
		end
  end
 end