# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  mount_uploader :attachment, AttachmentUploader

   validates :attachment, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i,
   message: 'Photo must GIF, JPG or PNG image.' }, if: -> { attachable_type == 'IncidentReport' }
end
