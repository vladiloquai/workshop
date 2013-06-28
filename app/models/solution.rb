class Solution < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  # Creator
  belongs_to :user

  # Incidents
  has_many :incident_solutions
  has_many :incidents, through: :incident_solutions
end
