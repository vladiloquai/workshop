require 'spec_helper'

describe "incidents/show" do
  before(:each) do
    @incident = assign(:incident, stub_model(Incident,
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
  end
end
