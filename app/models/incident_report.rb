class IncidentReport < ApplicationRecord
	has_many :attachments, as: :attachable, dependent: :destroy
	accepts_nested_attributes_for :attachments, allow_destroy: true
end
