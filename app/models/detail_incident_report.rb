class DetailIncidentReport < ApplicationRecord

	attr_accessor :observer_detail, :location_other_text

	INCIDENT_TYPE = {'Alcohal' => 'alcohal', 'Assault' => 'assault', 'Bullying' => 'bullying', 'Hazing' => 'hazing',  'Drugs' => 'drugs', 'Graffiti' => 'graffiti', 'Injury' => 'injury', 'Suepicious activity' => 'suspecious_activity', 'Trespassing' => 'trespassing', 'Vandalism' => 'vandalism', 'Weapons violation' => 'weapons_violation', 'Technology misuse' => 'technology_misuse', 'Other' => 'other' }
	ROLE_TYPE = {'Student' => 'student', 'Teacher' => 'teacher', 'Other staff' => 'other_staff', 'Parent' => 'parent', 'Community member' => 'community_member'}
	LOCATIONS = {a: 'a', other: 'other'}

	has_one :observer, dependent: :destroy
	has_many :attachments, as: :attachable, dependent: :destroy
	accepts_nested_attributes_for :attachments, :observer, allow_destroy: true

	validates :description, presence: true
end
