class IncidentUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident
end
