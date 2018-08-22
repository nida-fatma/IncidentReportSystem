# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :attachment
      t.references :incident_report, foreign_key: true
      
      t.timestamps
    end
  end
end
