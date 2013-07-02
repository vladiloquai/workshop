class AddFieldsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :closed_at, :datetime
    add_column :incidents, :incident_status_id, :integer, :null => false, :default => 1
    add_column :incidents, :contact_method_id, :integer
    add_column :incidents, :impact_id, :integer
    add_column :incidents, :urgency_id, :integer
    add_column :incidents, :possible_solution, :text
  end
end
