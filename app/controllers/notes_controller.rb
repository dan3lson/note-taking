class NotesController < ApplicationController
	def new
		@meeting = Meeting.find(params[:meeting_id])
		@note = Note.new
		@type = params[:type]
	end

	def create
    @meeting = Meeting.find(params[:meeting_id])
    @note = Note.new(note_params)
    @note.meeting = @meeting
		@note_content = params[:note][:content]
		@params_note_type = params[:note][:id]
		@note_type = NoteType.find_by(name: params[:note][:id])
		@note_record = NoteRecord.new
		@note_record.note_type = @note_type
		@note_record.note = @note

    if @params_note_type.blank? || @note_content.blank?
			@error = true
      @message = "Both fields can\'t be blank before clicking \'Create\'."

			respond_to do |format|
				format.js { render template: "notes/create_error.js.erb" }
			end
    else
      if @note.save && @note_record.save
        @message = "Note successfully created!"

				respond_to do |format|
					format.js
				end
      else
        @message = "Yikes! Something went wrong. Please try again."

				respond_to do |format|
					format.js { render template: "notes/create_error.js.erb" }
				end
      end
    end
  end

	private

	def note_params
		params.require(:note).permit(:content)
	end
end
