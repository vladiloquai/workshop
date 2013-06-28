class Incident < ActiveRecord::Base
  attr_accessible :description, 
				 					:title,  
				 					:possible_solution, 
				 					:contact_method_id,
                  :category_ids

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
end
