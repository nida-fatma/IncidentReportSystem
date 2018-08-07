class CreateObservers < ActiveRecord::Migration[5.2]
  def change
    create_table :observers do |t|
    	t.string :name
    	t.string :email
    	t.string :role
    	t.integer :detail_incident_report_id
    end
  end
end
