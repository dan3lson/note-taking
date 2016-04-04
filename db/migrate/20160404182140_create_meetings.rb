class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :organizer, null: false
      t.string :subject, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :attendees
      t.text :body
      t.string :location
      t.timestamps null: false
    end
  end
end
