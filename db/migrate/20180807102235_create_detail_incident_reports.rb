class CreateDetailIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_incident_reports do |t|
        t.text :incident_type, default: [], array:true
    	t.string :people_involved
    	t.string :other_observer
    	t.string :date_time_observed
    	t.string :location
    	t.string :description

    	t.timestamps
    end
  end
end
