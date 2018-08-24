# frozen_string_literal: true

class IncidentReport < ApplicationRecord
  # Virtual attributes
  attr_accessor :incident_report_type

  # Associations
  has_many :attachments, dependent: :destroy
  has_one :detail_incident_report, dependent: :destroy
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :detail_incident_report,
                               	reject_if: :incident_report_type?


  # Validations
  validates :description, presence: true

  # Incident report type 0 denotes incident in brief & 1 denotes incident in detail
  def incident_report_type?
  	incident_report_type != '1'
  end


end
