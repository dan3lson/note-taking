class NotesController < ApplicationController
	def new
		@meeting = Meeting.find(params[:meeting_id])
		@note = Note.new
		@type = params[:type]

		respond_to do |format|
      format.js
    end
	end

	def create
    @meeting = Meeting.find(params[:version_id])
    @content = params[:note][:content]
    @note = Note.new(note_params)
    @note.meeting = @meeting
		@note_record = NoteRecord.new
		@note_record.type = @type
		@note_record.note = @note

    if @content.blank?
      flash[:danger] = "Please add content before clicking \'create\'."

      redirect_to new_meeting_note_path(@meeting)
    else
      if @note.save
        msg = "Note successfully created!"
        flash[:success] = msg

        redirect_to @note
      else
        flash.now[:danger] = "Yikes! Something went wrong. Please try again."

        render "versions/show"
      end
    end
  end

	private

	def note_params
		params.require(:note).permit(:content)
	end
end
