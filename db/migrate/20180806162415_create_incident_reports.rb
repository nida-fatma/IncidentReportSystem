# frozen_string_literal: true

class CreateIncidentReports < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_reports do |t|
      t.text :description

      t.timestamps
    end
  end
end
