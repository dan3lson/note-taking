class Meeting < ActiveRecord::Base
	has_many :notes

	validates :name, presence: true
	validates :date, presence: true
end
