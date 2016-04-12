class AddIndicesNoteRecords < ActiveRecord::Migration
  def change
    add_index :note_records, :note_id
    add_index :note_records, :note_type_id
    add_index :note_records, [:note_id, :note_type_id]
  end
end
