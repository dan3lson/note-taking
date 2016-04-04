class Create < ActiveRecord::Migration
  def change
    create_table :note_types do |t|
      t.text :name, null: false
      t.integer :note_id, null: false
      t.timestamps null: false
    end
  end
end
