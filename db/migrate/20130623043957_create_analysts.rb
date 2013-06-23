class CreateAnalysts < ActiveRecord::Migration
  def change
    create_table :analysts do |t|
      t.integer :status

      t.timestamps
    end
  end
end
