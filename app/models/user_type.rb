class UserType < ActiveRecord::Base
	attr_accessible :id, :code, :description
	
	# Incidents Users
  has_many :incident_user_types
  has_many :incident_users, :through => :incident_user_types
end
