require 'spec_helper'

describe IncidentUser do
   #associations
  it "has belongs to incident" do
    should belong_to :incident
  end

  it "has belongs to user" do
    should belong_to :user
  end
end
