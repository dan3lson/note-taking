class NotesController < ApplicationController
	def new
		respond_to |format| do
			format.js
		end
	end
end
