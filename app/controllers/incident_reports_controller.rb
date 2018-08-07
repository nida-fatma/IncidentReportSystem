class IncidentReportsController < ApplicationController
  before_action :set_incident_report, only: [:show, :edit, :update, :destroy]

  
  # GET /incident_reports/new
  def new
    @incident_report = IncidentReport.new
    @incident_report.pictures.build
  end

  # POST /incident_reports
  # POST /incident_reports.json
  def create
    @incident_report = IncidentReport.new(incident_report_params)

    respond_to do |format|
      if @incident_report.save
        debugger
        if incident_report_params[:pictures]     
          incident_report_params[:pictures].each { |picture|
            @incident_report.pictures.create(picture: picture)
          }
        end
        @incident_report = IncidentReport.new
        format.html { redirect_to root_path, notice: 'Thank You Incident has been successfully Reported.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_report
      @incident_report = IncidentReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_report_params
      params.require(:incident_report).permit( :description,  pictures_attributes: [picture: [],:imageable_id,:imageable_type])
    end
end
