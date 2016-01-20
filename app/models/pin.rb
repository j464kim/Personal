class Pin < ActiveRecord::Base
 	# now can call @pin.user
	belongs_to :user
end
