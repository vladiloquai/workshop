class IncidentUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident

  # User Types
  has_many :incident_user_types
  has_many :user_types, :through => :incident_user_types
end
