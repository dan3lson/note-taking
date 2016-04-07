module MeetingsHelper
	# not tested
	def attendees(meeting)
		meeting.attendees.split(",").sort_by { |letter| letter[0] }
	end

	# not tested
	def num_attendees(meeting)
		attendees(meeting).length
	end

	# not tested
	def last_item?(index, length)
		index == length - 1
	end

	# not tested
	def shorten(string)
		truncate(string.upcase, length: 25)
	end
end
