class IncidentReportsController < ApplicationController

  # GET /incident_reports/new
  def new
    @incident_report = IncidentReport.new
    @incident_report.attachments.build
  end

  # POST /incident_reports
  def create
    @incident_report = IncidentReport.new(incident_report_params)
    respond_to do |format|
      if @incident_report.save
        format.html { redirect_to root_path, notice: 'Thank You Incident has been successfully Reported.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_report_params
      params.require(:incident_report).permit( :description,  :attachments_attributes => [:attachment])
    end
end
