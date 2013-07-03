class Incident < ActiveRecord::Base
  # Attributes
  attr_accessible :description, 
				 					:title,  
				 					:possible_solution, 
				 					:contact_method_id,
                  :category_ids,
                  :status_id,
                  :incident_users_attributes,
                  :creator_id,
                  :requester_id,
                  :finisher_id,
                  :assigned_id

  # Validations
  validates_presence_of :title, 
  											:description, 
  											:contact_method_id,
                        :category_ids,
  											message: I18n.t('messages.not_blank')

  # Associations
  belongs_to :incident_status
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  belongs_to :requester, foreign_key: :requester_id, class_name: "User"
  belongs_to :finisher, foreign_key: :finisher_id, class_name: "User"
  belongs_to :assigned, foreign_key: :assigned_id, class_name: "User"

  # Users
  has_many :incident_users
  has_many :users, through: :incident_users

  # Categories
  has_many :incident_categories
  has_many :categories, through: :incident_categories

  # Solutions
  has_many :incident_solutions
  has_many :solutions, through: :incident_solutions

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

  def set_creator user
    self.creator= user
    self.save
  end
end
