class NoteRecord < ActiveRecord::Base
	belongs_to :note
	belongs_to :note_type

	validates :note, presence: true
	validates :note_type, presence: true
end
