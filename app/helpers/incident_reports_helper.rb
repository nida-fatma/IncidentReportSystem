# frozen_string_literal: true

module IncidentReportsHelper

	# Label to show for swithing b/w brief and detail view
	def incident_label(incident)
		incident.incident_report_type? ? I18n.t("detail_report") : I18n.t("brief_report")
	end

	# Class to manage visibilaty of detail form
	def incident_class(incident)
		incident.incident_report_type?  ? 'hidden' : ''
	end

	# Class to manage visibilaty of observer form it will not show when anonymus
	def observer_class(detail_incident)
		detail_incident.observer.observer_detail == 'false' ? 'hidden' : ''
	end
end
