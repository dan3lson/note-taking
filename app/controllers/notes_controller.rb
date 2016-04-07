class NotesController < ApplicationController
	def new
		@meeting = Meeting.find(params[:meeting_id])
		@note = Note.new
		@type = params[:type]

		respond_to do |format|
      format.js
    end
	end
end
