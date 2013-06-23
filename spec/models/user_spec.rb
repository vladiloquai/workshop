require 'spec_helper'

describe User do
	#attributes
	it "has a name" do
		respond_to :name
	end	

	it "has a lastname" do
		respond_to :lastname
	end

	it "has a email" do
		respond_to :email
	end

	it "has a password" do
		respond_to :password
	end

	it "has a password confirmation" do
		respond_to :password_confirmation
	end

	it "has a remember_me field" do
		respond_to :remember_me
	end

	#associations
	it "has many incident_users" do
    should have_many :incident_users
  end

  it "has many incidents" do
    should have_many(:incidents).through(:incident_users)
  end

  it "has belongs to" do
    should belong_to :client
  end

  it "has belongs to" do
    should belong_to :analyst
  end
end
