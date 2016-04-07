module ApplicationHelper
	# not tested
	def todays_date
		time = Time.new

		time.strftime("%A, %B #{time.day.ordinalize}")
	end

	# not tested
	def time_of_day_greeting
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
end
