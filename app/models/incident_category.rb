class IncidentCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :incident
end
