# frozen_string_literal: true

class DetailIncidentReport < ApplicationRecord
  # Virtual attributes
  attr_accessor :observer_detail, :location_other_text

  # Constants
  INCIDENT_TYPE = { 'Alcohol' => 'alcohol', 'Assault' => 'assault', 'Bullying' => 'bullying',
  	'Hazing' => 'hazing', 'Drugs' => 'drugs', 'Graffiti' => 'graffiti', 'Injury' => 'injury',
  	'Suspicious activity' => 'suspecious_activity', 'Trespassing' => 'trespassing',
    'Vandalism' => 'vandalism', 'Weapons violation' => 'weapons_violation',
    'Technology misuse' => 'technology_misuse', 'Other' => 'other' }.freeze
  ROLE_TYPE = { 'Student' => 'student', 'Teacher' => 'teacher', 'Other staff' => 'other_staff',
  	'Parent' => 'parent', 'Community member' => 'community_member' }.freeze
  LOCATIONS = { 'On school campuses and grounds' => 'campus',
    'During transportation to and from school' => 'transport',
    'At school-sponsored events' => 'events', 'Other' => 'other' }.freeze

  # Associations
  has_one :observer, dependent: :destroy
  belongs_to :incident_report
  accepts_nested_attributes_for :observer, reject_if: :all_blank

  # Validations
  validates :people_involved, :other_observer, length: {minimum: 3}, allow_blank: true
  validate :any_attributes_present?
  validate :date_observed

  # Delegates
  delegate :role, :to => :observer, :prefix => true, :allow_nil => true

  private

  # Raise error if no any attributes present in detail report
  def any_attributes_present?  
    errors.add(:base, :invalid) if attributes.values.all?(&:blank?)
  end

  # Raise error if date is future date
  def date_observed
    errors.add(:date_time_observed, :invalid) if date_time_observed && date_time_observed > Time.now
  end
end
