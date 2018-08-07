class CreateDetailIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_incident_reports do |t|
    	t.string :incident_type
    	t.string :people_involved
    	t.string :other_observer
    	t.datetime :date_time_observed
    	t.string :location
    	t.string :description

    	t.timestamps
    end
  end
end
