class Batch < ApplicationRecord

  has_many :students
  belongs_to :instrument
  belongs_to :center
end
