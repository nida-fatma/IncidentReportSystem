# frozen_string_literal: true

class Observer < ApplicationRecord
  attr_accessor :observer_detail

  belongs_to :detail_incident_report
  validate :validate_for_email_or_phone, if: -> { observer_detail == 'true' }

  def validate_for_email_or_phone
    unless email_or_phone =~ URI::MailTo::EMAIL_REGEXP || email_or_phone =~ /\d[0-9]\)*\z/ || email_or_phone.blank?
      errors.add(:email_or_phone, 'format is not correct')
    end
  end
end
