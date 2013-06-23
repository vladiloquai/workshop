require 'spec_helper'

describe "incidents/index" do
  before(:each) do
    assign(:incidents, [
      stub_model(Incident,
        :title => "Title",
        :description => "Description"
      ),
      stub_model(Incident,
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of incidents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
