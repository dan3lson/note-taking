class AddIndicesNoteTypes < ActiveRecord::Migration
  def change
    add_index :note_types, :name
  end
end
