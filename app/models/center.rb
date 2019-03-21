class Center < ApplicationRecord
	has_many :fees
	has_many :expenses
	has_many :batches
end
