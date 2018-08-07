class DetailIncidentReport < ApplicationRecord
	has_one :observer, dependent: :destroy
	has_many :attachments, as: :attachable, dependent: :destroy
	accepts_nested_attributes_for :attachments, :observer, allow_destroy: true
end
