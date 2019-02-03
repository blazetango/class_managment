class Expense < ApplicationRecord
  belongs_to :month
  has_many :transactions, as: :transactable
end
