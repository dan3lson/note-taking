class MeetingsController < ApplicationController
	def index
		token = session[:azure_access_token]
		email = session[:user_email]

		if token
			conn = Faraday.new(:url => 'https://outlook.office.com') do |faraday|
				faraday.response :logger
				faraday.adapter  Faraday.default_adapter
			end

			response = conn.get do |request|
				request.url '/api/v2.0/Me/Events?$orderby=Start/DateTime asc&$select=Organizer,Subject,Start,End,Body,Attendees'
				request.headers['Authorization'] = "Bearer #{token}"
				request.headers['Accept'] = "application/json"
				request.headers['X-AnchorMailbox'] = email
			end

			if response.status == 200
				@events = JSON.parse(response.body)['value']

				@events.each do |e|
					m = Meeting.new
					m.api_id = e["Id"]
					m.organizer = "#{e["Organizer"]["EmailAddress"]["Name"]}, #{e["Organizer"]["EmailAddress"]["Address"]}"
					m.subject = e["Subject"]
					m.start_date = e["Start"]["DateTime"].to_datetime
					m.end_date = e["End"]["DateTime"].to_datetime
					m.body = Meeting.just_text(
						ActionController::Base.helpers.strip_tags(e["Body"]["Content"])
					)
					m.attendees = ""

					if e["Attendees"].any?
						e["Attendees"].each do |attendee|
							name = attendee["EmailAddress"]["Name"]
							m.attendees << "#{name},"
						end
					end

					if Meeting.already_exists?(m.api_id)
						mtg = Meeting.find_by(api_id: m.api_id)
						mtg.update_attributes(
							subject: m.subject,
							start_date: m.start_date,
							end_date: m.end_date,
							body: m.body,
							attendees: m.attendees,
						)
						Rails.logger.info("Meeting #{mtg.id} #{mtg.subject} updated.")
					else
						if m.save
							Rails.logger.info("Meeting #{m.id} successfully saved.")
						else
							Rails.logger.info("ERROR: Meeting #{m.id} not saved.")
						end
					end
				end

				@meetings = Meeting.today

				respond_to do |format|
					format.html
					format.js
				end
			else
				Rails.logger.info("SORRY, YOU HAVE BEEN LOGGED OUT.")
				@timeout_msg = "Unfortunately you\'ve been logged out. Please log in."

				render :js => "window.location.href = '#{root_path}'"
			end
		else
			redirect_to root_path
		end
	end

	def show
		@meeting = Meeting.find(params[:id])

		respond_to do |format|
      format.js
    end
	end

	def show_filter
		@index = params[:index].to_i
		@meetings = Meeting.today
		@num_meetings = @meetings.count
		@meeting = @meetings[@index]
		@note_type = params[:note_type]

		respond_to do |format|
			format.js
		end
	end
end
