class Incident < ActiveRecord::Base
  # Attributes
  attr_accessible :description, 
				 					:title,  
				 					:possible_solution, 
				 					:contact_method_id,
                  :category_ids,
                  :incident_users_attributes

  # Validations
  validates_presence_of :title, 
  											:description, 
  											:contact_method_id,
                        :category_ids,
  											message: I18n.t('messages.not_blank')

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
  #before_save :set_creator, :set_requester

  accepts_nested_attributes_for :incident_users

  #============================USER TYPE LOGIC================================#

  # Verified if incident has a specific user
  def has_user? user
    !incident_users.where(user_id: user.id).blank?
  end

  # Get incident creator
  def creator
    incident_users.select{|iu| iu.is_creator?}.user
  end

  # Get incident assigned
  def assigned 
    incident_users.select{|iu| iu.is_assigned?}.user
  end

  # Get incident analyst
  def analyst 
    incident_users.select{|iu| iu.is_analyst?}.user
  end

  # Get incident requester
  def requester 
    incident_users.select{|iu| iu.is_requester?}.user
  end

  # Get incident finisher
  def finisher 
    incident_users.select{|iu| iu.is_finisher?}.user
  end

  # Set incident creator. (This must be the first before_save callback)
  def set_creator
    iu= self.incident_users.build({incident_id: self.id, user_id: current_user.id})
    iu.user_types << UserType.where(code: "c").first
  end

  # Set incident requester
  def set_requester user
    iu= has_user?(user) ? 
          self.incident_users.where({incident_id: self.id, user_id: user.id}).first :
          self.incident_users.build({incident_id: self.id, user_id: user.id})
    iu.user_types << UserType.where(code: "r").first
  end
end
