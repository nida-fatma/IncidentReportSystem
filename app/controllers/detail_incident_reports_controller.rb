# frozen_string_literal: true

class DetailIncidentReportsController < ApplicationController
  # GET /incident_reports/new
  def new
    @detail_incident_report = DetailIncidentReport.new
    @detail_incident_report.attachments.build
    @detail_incident_report = @detail_incident_report.build_observer
    @detail_incident_repor.build_observer
  end

  # POST /incident_reports
  def create
    @detail_incident_report = DetailIncidentReport.new(detail_incident_report_params)
    respond_to do |format|
      if @detail_incident_report.save
        format.html { redirect_to root_path, notice: 'Thank You Detail Incident has been successfully Reported.' }
      else
        @detail_incident_report.attachments.build if @detail_incident_report.attachments.blank?
        format.html { render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def detail_incident_report_params
    required_parameter = params.require(:detail_incident_report).permit(:people_involved, :other_observer, :date_time_observed,
                                                                        :location, :location_other_text, :description, observer_attributes: %i[name email_or_phone role observer_detail], attachments_attributes: [:attachment], incident_type: [])
    required_parameter[:location] = required_parameter[:location_other_text] if required_parameter[:location] == 'other'
    required_parameter
  end
end
