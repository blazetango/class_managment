class Attendence < ApplicationRecord
  belongs_to :student
  belongs_to :batch
  
end
