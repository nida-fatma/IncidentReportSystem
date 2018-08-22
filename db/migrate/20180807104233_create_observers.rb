# frozen_string_literal: true

class CreateObservers < ActiveRecord::Migration[5.2]
  def change
    create_table :observers do |t|
      t.string :name
      t.string :email_or_phone
      t.string :role
      t.references :detail_incident_report

      t.timestamps
    end
  end
end
