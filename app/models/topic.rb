class Topic < ApplicationRecord
	has_many :comments
	belonds_to :catagory
end
