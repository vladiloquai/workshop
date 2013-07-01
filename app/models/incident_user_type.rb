class IncidentUserType < ActiveRecord::Base
  attr_accessible :incident_user_id, :user_type_id

  # Asociation
  belongs_to :user_type
  belongs_to :incident_user
end
