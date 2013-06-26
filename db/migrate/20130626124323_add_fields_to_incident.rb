class AddFieldsToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :closed_at, :datetime
    add_column :incidents, :status_id, :integer
    add_column :incidents, :contact_method_id, :integer
    add_column :incidents, :category_id, :integer
    add_column :incidents, :solution_id, :integer
    add_column :incidents, :impact_id, :integer
    add_column :incidents, :urgency_id, :integer
    add_column :incidents, :possible_solution, :text
  end
end
