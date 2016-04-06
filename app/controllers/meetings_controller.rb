class MeetingsController < ApplicationController
	def index
		@meetings = Meeting.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@meeting = Meeting.find(params[:id])

		respond_to do |format|
      format.js
    end
	end
end
