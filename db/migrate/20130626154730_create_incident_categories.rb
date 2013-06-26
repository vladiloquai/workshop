class CreateIncidentCategories < ActiveRecord::Migration
  def change
    create_table :incident_categories do |t|
      t.integer :incident_id
      t.integer :category_id

      t.timestamps
    end
  end
end
