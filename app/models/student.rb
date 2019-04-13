class Student < ApplicationRecord
	belongs_to :batch
	has_many :fees
	has_many :attendences

	validate :check_capacity

	def check_capacity

		if  self.batch.students.count >= self.batch.capacity
      return false,  errors.add(:base, "Batch capacity exceeded.")
		end
	end
end
