class Incident < ActiveRecord::Base
  attr_accessible :description, :title
  validates_presence_of :title, :description

  # Users
  has_many :incident_users
  has_many :users, through: :incident_users
end
