class NoteType < ActiveRecord::Base
	belongs_to :note

	validates :name, presence: true
	validates :note, presence: true
end
