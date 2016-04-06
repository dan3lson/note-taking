module MeetingsHelper
	# not tested
	def todays_date
		time = Time.new

		time.strftime("%A, %B #{time.day.ordinalize}")
	end

	# not tested
	def time_of_day
		hour = Time.now.hour

		if hour < 12
			"Good Morning"
		elsif hour > 11 && hour < 19
			"Good Afternoon"
		else
			"Good Evening"
		end
	end

	# not tested
	def current_time
		Time.now.strftime("%I:%M %p")
	end

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
