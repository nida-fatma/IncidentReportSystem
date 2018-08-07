class DetailIncidentReportsController < ApplicationController

  # GET /incident_reports/new
  def new
    @detail_incident_report = DetailIncidentReport.new
    @detail_incident_report.attachments.build
    @detail_incident_report.build_observer
  end

  # POST /incident_reports
  def create
    @detail_incident_report = DetailIncidentReport.new(detail_incident_report_params)
    respond_to do |format|
      if @detail_incident_report.save
        format.html { redirect_to root_path, notice: 'Thank You Detail Incident has been successfully Reported.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_incident_report_params
      params.require(:detail_incident_report).permit( :incident_type, :people_involved, :other_observer, :date_time_observed,
       :location, :description, observer_attributes: [:name, :email, :role], attachments_attributes: [:attachment])
    end
end
