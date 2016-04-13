class Meeting < ActiveRecord::Base
	has_many :notes

	validates :api_id, presence: true
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

	# not tested
	def notes
		Note.where(meeting: self)
	end

	def retrieve_note(note_type_id)
		nr = NoteRecord.find_by(note: self.notes, note_type_id: note_type_id)
		nr.note ? nr : "note doesn\'t exist"
	end

	# not tested
	def pre_note
		retrieve_note(1)
	end

	# not tested
	def current_note
		retrieve_note(2)
	end

	# not tested
	def post_note
		retrieve_note(3)
	end

	# not tested
	def pre_note_content
		pre_note.content
	end

	# not tested
	def current_note_content
		current_note.content
	end

	# not tested
	def post_note_content
		post_note.content
	end

	# not tested
	def self.already_exists?(api_id)
		exists?(api_id: api_id)
	end

	def self.today
		where("start_date >= ?", Time.zone.now.beginning_of_day)
	end

	def self.today_filtered(note_type)
		binding.pry
	end
end
