require 'spec_helper'

describe Incident do
	#attributes	
  it "has a title" do
    should respond_to :title
  end

  it "has a description" do
  	should respond_to :description
  end

  #associations
  it "has many incident_users" do
    should have_many :incident_users
  end

  it "has many users" do
    should have_many(:users).through(:incident_users)
  end

  #validations
  it "has a valid factory" do
    FactoryGirl.build(:incident).should be_valid
  end

  it "requires a title" do
    FactoryGirl.build(:incident, title: "").should_not be_valid
  end

  it "requires a description" do
    FactoryGirl.build(:incident, description: "").should_not be_valid
  end


end
