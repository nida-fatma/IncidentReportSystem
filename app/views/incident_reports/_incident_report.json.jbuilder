json.extract! incident_report, :id, :school_name, :description, :created_at, :updated_at
json.url incident_report_url(incident_report, format: :json)
