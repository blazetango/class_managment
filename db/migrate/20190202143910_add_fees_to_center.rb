class AddFeesToCenter < ActiveRecord::Migration[5.1]
  def change
    add_reference :fees, :center, foreign_key: true
  end
end
