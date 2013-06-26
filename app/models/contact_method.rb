 #encoding: utf-8
class ContactMethod
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Conversion

  attr_accessor :id, :name, :code

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
 
  def persisted?
    false
  end

  CONTACTS = [{id:  1, name: 'correo electrónico'  },
              {id:  2, name: 'telefono'     },
              {id:  3, name: 'sms' },
              {id:  4, name: 'web'}]

  def self.status_ids
    CONTACTS.map{|i| i[:id]}
  end

  def self.find id
    if status_ids.include? id
      ContactMethod.new CONTACTS[id-1]
    end
  end

  def self.name id
    CONTACTS[id-1][:name]
  end

  def self.id name
    list = CONTACTS.select{|s| s[:name] == name}  
    list.first[:id]
  end
end