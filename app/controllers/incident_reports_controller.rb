# frozen_string_literal: true

class IncidentReportsController < ApplicationController
  # GET /incident_reports/new
  def new
    @incident_report = IncidentReport.new
    @incident_report.attachments.build
    @detail_incident_report = @incident_report.build_detail_incident_report
    @detail_incident_report.build_observer
  end

  # POST /incident_reports
  def create
    @incident_report = IncidentReport.new(incident_report_params)
    respond_to do |format|
      if @incident_report.save
        format.html { redirect_to root_path, notice: 'Thank You Incident has been successfully Reported.' }
      else
        @incident_report.attachments.build if @incident_report.attachments.blank?
        @detail_incident_report = @incident_report.build_detail_incident_report
        format.html { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def incident_report_params
    params.require(:incident_report).permit(:description, :incident_report_type, 
      attachments_attributes: [:attachment], detail_incident_report_attributes: [:incident_type,
      :people_involved, :other_observer, :date_time_observed, :location])
  end
end
