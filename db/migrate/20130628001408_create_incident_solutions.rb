class CreateIncidentSolutions < ActiveRecord::Migration
  def change
    create_table :incident_solutions do |t|
      t.integer :incident_id
      t.integer :solution_id

      t.timestamps
    end
  end
end
