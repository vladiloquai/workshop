class IncidentUser < ActiveRecord::Base
	# Attributes
	attr_accessible :user_id, :incident_id

	# Associations
  belongs_to :user
  belongs_to :incident

  # User Types
  has_many :incident_user_types
  has_many :user_types, :through => :incident_user_types

  # Validations
  validates_presence_of :user_id

  def has_type type
  	!user_types.select{|u| u.code == type}.blank?
  end

  def is_creator?
  	has_type "c"
  end

  def is_assigned?
  	has_type "aa"
  end

  def is_analyst?
  	has_type "a"
  end

  def is_requester?
  	has_type "r"
  end

  def is_finisher?
  	has_type "f"
  end
end
