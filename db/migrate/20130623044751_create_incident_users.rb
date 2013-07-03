class CreateIncidentUsers < ActiveRecord::Migration
  def change
    create_table :incident_users do |t|
      t.integer :user_id
      t.integer :incident_id
      t.datetime :issue_date

      t.timestamps
    end
  end
end
