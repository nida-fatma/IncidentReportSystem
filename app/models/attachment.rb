# frozen_string_literal: true

class Attachment < ApplicationRecord
  # Association
  belongs_to :incident_report

  # Uploaders
  mount_uploader :attachment, AttachmentUploader

  # Validations

  # Validate attachment only if reported incident is in brief
  validates :attachment, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i },
   if: -> { incident_report.incident_report_type? }
end
