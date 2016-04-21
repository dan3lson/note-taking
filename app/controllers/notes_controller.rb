class NotesController < ApplicationController
	def new
		@meeting = Meeting.find(params[:meeting_id])
		@note = Note.new
		@note_type = params[:note_type]

		respond_to do |format|
			format.js
		end
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
        @message = "Yikes! Please try to create that note again."

				respond_to do |format|
					format.js { render template: "notes/create_error.js.erb" }
				end
      end
    end
  end

	def edit
		@meeting = Meeting.find(params[:meeting_id])
    @note = Note.find(params[:id])
		@note_type = params[:note_type]

		respond_to do |format|
			format.js
		end
	end

	def update
		@note = Note.find(params[:id])
		@note_type = params[:note_type]
		@meeting = Meeting.find(params[:meeting_id])

		if @note.update(note_params)
			@message = "Changes successfully made."

			respond_to do |format|
				format.js
			end
		else
			@message = "Changes not successfully made."

			respond_to do |format|
				format.js { render template: "notes/update_error_message.js.erb" }
			end
		end
	end

	def destroy
		@note_type = NoteType.find_by(name: params[:note_type])
		@note = Note.find(params[:id])
		@note_record = NoteRecord.find_by(note: @note)
		@meeting = @note.meeting

    if @note.destroy && @note_record.destroy
      @message = "Note deleted successfully."

			respond_to do |format|
				format.js
			end
    else
      flash.now[:danger] = "Yikes! Please try to delete that note again."

			respond_to do |format|
				format.js { render template: "notes/delete_error.js.erb" }
			end
    end
  end

	private

	def note_params
		params.require(:note).permit(:content)
	end
end
