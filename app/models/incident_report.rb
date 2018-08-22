# frozen_string_literal: true

class IncidentReport < ApplicationRecord
  attr_accessor :incident_report_type
  
  has_many :attachments, dependent: :destroy
  has_one :detail_incident_report, dependent: :destroy
  accepts_nested_attributes_for :attachments, :detail_incident_report, reject_if: :all_blank
  

  validates :description, presence: true


end
