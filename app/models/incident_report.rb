# frozen_string_literal: true

class IncidentReport < ApplicationRecord
  attr_accessor :incident_report_type

  has_many :attachments, dependent: :destroy
  has_one :detail_incident_report, dependent: :destroy
  accepts_nested_attributes_for :attachments

  accepts_nested_attributes_for :detail_incident_report,
                               	reject_if: :incident_report_type?


  validates :description, presence: true

  def incident_report_type?
  	self.incident_report_type != 'true'
  end


end
