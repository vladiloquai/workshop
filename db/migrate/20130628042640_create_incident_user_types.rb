class CreateIncidentUserTypes < ActiveRecord::Migration
  def change
    create_table :incident_user_types do |t|
      t.integer :user_type_id
      t.integer :incident_user_id

      t.timestamps
    end
  end
end
