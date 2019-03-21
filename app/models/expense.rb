class Expense < ApplicationRecord
  belongs_to :month
  belongs_to :center

  has_many :transactions, as: :transactable
end
