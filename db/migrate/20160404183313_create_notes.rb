class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content, null: false
      t.integer :meeting_id, null: false
      t.timestamps null: false
    end
  end
end
