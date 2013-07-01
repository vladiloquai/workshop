class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
