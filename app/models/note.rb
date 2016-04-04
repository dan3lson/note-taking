class Note < ActiveRecord::Base
	belongs_to :meeting

	validates :content, presence: true
	validates :meeting, presence: true
end
