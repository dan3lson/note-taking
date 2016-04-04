class Meeting < ActiveRecord::Base
	has_many :notes

	validates :organizer, presence: true
	validates :subject, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true

	def has_notes?
		notes.count > 0
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
end
