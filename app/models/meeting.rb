class Meeting < ActiveRecord::Base
	has_many :notes

	validates :organizer, presence: true
	validates :subject, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true

	def has_notes?
		notes.count > 0
	end

	# not tested
	def has_all_notes?
		notes.count == 3
	end

	def note_types
		notes = Note.where(meeting: self)
		notes.map { |n| n.note_types }.flatten.map { |nr| nr.name }
	end

	def has_pre_notes?
		note_types.include?("Pre")
	end

	def has_current_notes?
		note_types.include?("Current")
	end

	def has_post_notes?
		note_types.include?("Post")
	end

	# note tested
	def notes
		Note.where(meeting: self)
	end

	# not tested
	def pre_notes
		note_record = NoteRecord.where(note: self.notes, note_type_id: 1).first
		note_record.note.content
	end

	# not tested
	def current_notes
		note_record = NoteRecord.where(note: self.notes, note_type_id: 2).first
		note_record.note.content
	end

	# not tested
	def post_notes
		note_record = NoteRecord.where(note: self.notes, note_type_id: 3).first
		note_record.note.content
	end
end
