class Note < ActiveRecord::Base
	belongs_to :meeting
	has_many :note_records
	has_many :note_types, through: :note_records

	validates :content, presence: true
	validates :meeting, presence: true
end
