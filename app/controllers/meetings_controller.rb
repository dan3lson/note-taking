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

			@events = JSON.parse(response.body)['value']

			@events.each do |e|
				m = Meeting.new
				m.organizer = e["Organizer"]
				m.subject = e["Subject"]
				m.start_date = e["Start"]["DateTime"]
				m.end_date = e["End"]["DateTime"]
				m.body = e["Body"]["Content"]
				m.attendees = e["Attendees"] if e["Attendees"].any?

				if Meeting.already_exists?(
					m.organizer,
					m.subject,
					m.start_date,
					m.end_date,
					m.body
				)
					Rails.logger.info("Meeting #{m.id} #{m.subject} already exists.")
				else
					if m.save
						Rails.logger.info("Meeting #{m.id} successfully saved.")
					else
						Rails.logger.info("ERROR: Meeting #{m.id} not saved.")
					end
				end
			end

			@meetings = Meeting.all

			respond_to do |format|
				format.html
				format.js
			end
		else
			redirect_to root_url
		end
	end

	def show
		@meeting = Meeting.find(params[:id])

		respond_to do |format|
      format.js
    end
	end
end
