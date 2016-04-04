class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.string :attendees
      t.text :description
      t.string :location
      t.timestamps null: false
    end
  end
end
