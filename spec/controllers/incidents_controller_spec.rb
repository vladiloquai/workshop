require 'spec_helper'

describe IncidentsController do

  # let(:valid_attributes) { { "title" => "MyString" } }

  # let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all incidents as @incidents" do
  #     incident = Incident.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:incidents).should eq([incident])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested incident as @incident" do
  #     incident = Incident.create! valid_attributes
  #     get :show, {:id => incident.to_param}, valid_session
  #     assigns(:incident).should eq(incident)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new incident as @incident" do
  #     get :new, {}, valid_session
  #     assigns(:incident).should be_a_new(Incident)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested incident as @incident" do
  #     incident = Incident.create! valid_attributes
  #     get :edit, {:id => incident.to_param}, valid_session
  #     assigns(:incident).should eq(incident)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Incident" do
  #       expect {
  #         post :create, {:incident => valid_attributes}, valid_session
  #       }.to change(Incident, :count).by(1)
  #     end

  #     it "assigns a newly created incident as @incident" do
  #       post :create, {:incident => valid_attributes}, valid_session
  #       assigns(:incident).should be_a(Incident)
  #       assigns(:incident).should be_persisted
  #     end

  #     it "redirects to the created incident" do
  #       post :create, {:incident => valid_attributes}, valid_session
  #       response.should redirect_to(Incident.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved incident as @incident" do
        
  #       Incident.any_instance.stub(:save).and_return(false)
  #       post :create, {:incident => { "title" => "invalid value" }}, valid_session
  #       assigns(:incident).should be_a_new(Incident)
  #     end

  #     it "re-renders the 'new' template" do
        
  #       Incident.any_instance.stub(:save).and_return(false)
  #       post :create, {:incident => { "title" => "invalid value" }}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested incident" do
  #       incident = Incident.create! valid_attributes
        
  #       Incident.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
  #       put :update, {:id => incident.to_param, :incident => { "title" => "MyString" }}, valid_session
  #     end

  #     it "assigns the requested incident as @incident" do
  #       incident = Incident.create! valid_attributes
  #       put :update, {:id => incident.to_param, :incident => valid_attributes}, valid_session
  #       assigns(:incident).should eq(incident)
  #     end

  #     it "redirects to the incident" do
  #       incident = Incident.create! valid_attributes
  #       put :update, {:id => incident.to_param, :incident => valid_attributes}, valid_session
  #       response.should redirect_to(incident)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the incident as @incident" do
  #       incident = Incident.create! valid_attributes
        
  #       Incident.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => incident.to_param, :incident => { "title" => "invalid value" }}, valid_session
  #       assigns(:incident).should eq(incident)
  #     end

  #     it "re-renders the 'edit' template" do
  #       incident = Incident.create! valid_attributes
        
  #       Incident.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => incident.to_param, :incident => { "title" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested incident" do
  #     incident = Incident.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => incident.to_param}, valid_session
  #     }.to change(Incident, :count).by(-1)
  #   end

  #   it "redirects to the incidents list" do
  #     incident = Incident.create! valid_attributes
  #     delete :destroy, {:id => incident.to_param}, valid_session
  #     response.should redirect_to(incidents_url)
  #   end
  # end

end
