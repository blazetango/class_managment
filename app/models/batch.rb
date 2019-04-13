class Batch < ApplicationRecord

  has_many :students
  has_many :attendences
  belongs_to :instrument
  belongs_to :center
end
