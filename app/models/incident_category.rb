class IncidentCategory < ActiveRecord::Base
	belongs_to :category_id
	belongs_to :incident_id
end
