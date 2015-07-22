class Profile < ActiveRecord::Base
	#one-to-one relationship with profiles table
	belongs_to :user
end
