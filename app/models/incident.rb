class Incident < ActiveRecord::Base
  # Attributes
  attr_accessible :description, 
				 					:title,  
				 					:possible_solution, 
				 					:contact_method_id,
                  :category_ids,
                  :status_id,
                  :incident_users_attributes

  # Validations
  validates_presence_of :title, 
  											:description, 
  											:contact_method_id,
                        :category_ids,
  											message: I18n.t('messages.not_blank')

  # Associations
  belongs_to :incident_status

  # Users
  has_many :incident_users
  has_many :users, through: :incident_users

  # Categories
  has_many :incident_categories
  has_many :categories, through: :incident_categories

  # Solutions
  has_many :incident_solutions
  has_many :solutions, through: :incident_solutions

  # Callbacks
  before_save :set_requester

  accepts_nested_attributes_for :incident_users

  #============================ STATUSES LOGIC================================#
  def set_status status
    self.incident_status= IncidentStatus.where(name: status).first
  end

  #============================USER TYPE LOGIC================================#

  # Verified if incident has a specific user
  def has_user? user
    !incident_users.where(user_id: user.id).blank?
  end

  # Get incident creator
  def creator
    iu= incident_users.select{|iu| iu.is_creator?}.first
    iu.blank? ? iu : iu.user
  end

  # Get incident assigned
  def assigned 
    iu= incident_users.select{|iu| iu.is_assigned?}.first
    iu.blank? ? iu : iu.user
  end

  # Get incident analyst
  def analyst 
    iu= incident_users.select{|iu| iu.is_analyst?}.first
    iu.blank? ? iu : iu.user
  end

  # Get incident requester
  def requester 
    iu= incident_users.select{|iu| iu.is_requester?}.first
    iu.blank? ? iu : iu.user
  end

  # Get incident finisher
  def finisher 
    iu= incident_users.select{|iu| iu.is_finisher?}.first
    iu.blank? ? iu : iu.user
  end

  # Set incident requester. (This must be the first before_save callback)
  def set_requester
    incident_users.first.user_types << UserType.where(code: "r").first
  end

  # Set incident creator. Is called from controller
  def set_creator user
    # Validates if user is already in this incident
    iu = nil
    if has_user?(user)
      iu= incident_users.where({incident_id: self.id, user_id: user.id}).first
    else
      iu= IncidentUser.create({incident_id: self.id, user_id: user.id})
      incident_users << iu
    end
    iu.user_types << UserType.where(code: "c").first
  end
end
