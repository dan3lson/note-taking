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
	def body_exists?(meeting)
		!meeting.body.nil?
	end

	# not tested
	def last_item?(index, length)
		index == length - 1
	end

	# not tested
	def meetings_exist_today?
		Meeting.today.any?
	end

	# not tested
	def num_meetings_for_today
		meetings_exist_today? ? Meeting.today.count : 0
	end
end
