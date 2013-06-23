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

  # Roles Configuration
  ROLES = %w[client analyst admin]

  # The URL of the role
  ROLES_URL = %w[
      /incidents
      /incidents
      /incidents
  ]

  def role? _role 
    if self.role
      self.role.to_sym == _role
    else
      false
    end
  end
end
