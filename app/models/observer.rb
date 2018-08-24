# frozen_string_literal: true

class Observer < ApplicationRecord
  # Virtual attributes
  attr_accessor :observer_detail

  # Association
  belongs_to :detail_incident_report

  # Validations
  validates :name, presence: true, if: :observer_detail_info
  validates :name, length: {minimum: 3}, allow_blank: true, if: :observer_detail_info
  validate :validate_for_email_or_phone, if: :observer_detail_info


  # Define private methods here
  private

  # Observer detail selected or not
  def observer_detail_info
    observer_detail == 'true'
  end

  # Validate email format
  def email_fromat
    /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  end

  # Validate mobile format
  def mobile_fromat
    /\d[0-9]\)*\z/
  end

  # Validate email_or_phone if present
  def valid_format_email_or_phone?
    email_or_phone =~ email_fromat || email_or_phone =~ mobile_fromat || email_or_phone.blank?
  end

  # Validate against email or phone number format or can be blank
  def validate_for_email_or_phone
    unless valid_format_email_or_phone?
      errors.add(:email_or_phone, :invalid)
    end
  end

end
