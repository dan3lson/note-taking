module MeetingsHelper
	# not tested
	def attendees(meeting)
		if meeting.attendees.nil?
			""
		else
			meeting.attendees.split(",").sort_by { |letter| letter[0] }
		end
	end

	# not tested
	def num_attendees(meeting)
		attendees(meeting).length
	end

	def attendees_exist?(meeting)
		!attendees(meeting).blank?
	end

	# not tested
	def last_item?(index, length)
		index == length - 1
	end

	# not tested
	def shorten(string)
		truncate(string.upcase, length: 25)
	end

	# not tested
	def meetings_for_today
		Meeting.where("start_date >= ?", Time.zone.now.beginning_of_day)
	end

	# not tested
	def num_meetings_for_today
		meetings_for_today.count
	end
end
