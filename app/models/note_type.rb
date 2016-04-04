class NoteType < ActiveRecord::Base
	has_many :note_records
	has_many :notes, through: :note_records

	validates :name, presence: true
end
