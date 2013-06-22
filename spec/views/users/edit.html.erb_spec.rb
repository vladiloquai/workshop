require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "",
      :lastname => "",
      :email => "MyString",
      :email => "",
      :role => "",
      :client_id => "",
      :analyst_id => 1
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_lastname[name=?]", "user[lastname]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_role[name=?]", "user[role]"
      assert_select "input#user_client_id[name=?]", "user[client_id]"
      assert_select "input#user_analyst_id[name=?]", "user[analyst_id]"
    end
  end
end
