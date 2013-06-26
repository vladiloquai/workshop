class Category < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  # Incidents
  has_many :incident_categories
  has_many :incidents, through: :incident_categories
end
