class CreateAnalystStatuses < ActiveRecord::Migration
  def change
    create_table :analyst_statuses do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
