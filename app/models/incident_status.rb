class IncidentStatus < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :incidents
end
