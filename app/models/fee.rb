class Fee < ApplicationRecord
  belongs_to :student
  belongs_to :center
  belongs_to :month
  has_many :transactions, as: :transactable
end
