class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string, :name
      t.string, :lastname
      t.string :email
      t.string, :email
      t.string, :role
      t.integer, :client_id
      t.integer :analyst_id

      t.timestamps
    end
  end
end
