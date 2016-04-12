class AddIndicesNotes < ActiveRecord::Migration
  def change
    add_index :notes, :meeting_id
  end
end
