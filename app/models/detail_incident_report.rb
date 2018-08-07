class DetailIncidentReport < ApplicationRecord

	INCIDENT_TYPE = {'Alcohal' => 'alcohal', 'Assault' => 'assault', 'Bullying' => 'bullying', 'Hazing' => 'hazing' }

	has_one :observer, dependent: :destroy
	has_many :attachments, as: :attachable, dependent: :destroy
	accepts_nested_attributes_for :attachments, :observer, allow_destroy: true
end
