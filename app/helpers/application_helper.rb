module ApplicationHelper
	# not tested
	def todays_date
		time = Time.new
		time.strftime("%A, %B #{time.day.ordinalize}")
	end
end
