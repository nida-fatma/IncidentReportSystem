class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
  	create_table :attachments do |t|
      t.string :attachment
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
end
