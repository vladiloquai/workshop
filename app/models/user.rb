class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :analyst_id, :client_id, :email, :email, :lastname, :name, :role

  validates_presence_of :name, 
                        :lastname, 
                        :email, 
                        :password,
                        :password_confirmation, 
                        :role, 
                        message: I18n.t('messages.not_blank')

  validates :email, 
            format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, 
                      message: I18n.t('messages.invalid')}

  # Incidents
  has_many :incident_users
  has_many :incidents, :through => :incident_users

  belongs_to :client
  belongs_to :analyst

  # Roles Configuration
  ROLES = %w[client analyst admin]

  # The URL of the role
  ROLES_URL = %w[
      /incidents
      /incidents
      /incidents
  ]

  # Returns the user role
  def role? _role 
    if self.role
      self.role.to_sym == _role
    else
      false
    end
  end

  # Builds full name
  def fullname 
    self.name.to_s + " " + self.lastname.to_s
  end

  # Returns text before @ of attribute email
  def user_name
    email.split("@").first
  end
end
