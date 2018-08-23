# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :incident_report
  mount_uploader :attachment, AttachmentUploader

   validates :attachment, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i,
   message: 'Photo must GIF, JPG or PNG image.' }
end
