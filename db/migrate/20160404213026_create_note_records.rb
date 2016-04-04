class CreateNoteRecords < ActiveRecord::Migration
  def change
    create_table :note_records do |t|
      t.integer :note_id, null: false
      t.integer :note_type_id, null: false
      t.timestamps null: false
    end
  end
end
