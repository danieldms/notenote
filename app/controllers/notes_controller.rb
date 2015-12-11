class NotesController < ApplicationController

	before_action :find_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = Note.where(user_id: current_user ).order("created_at DESC")
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = current_user.notes.new(note_params)

		if @note.save
			flash[:notice] = "Note is create successfully!"
			redirect_to @note
		else
			flash[:alert] = "It's not possible create a New Note. Try again!"
			render "new"
		end
	end

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to @note
		else
			reder "edit"
		end				
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	private
		
		def find_note
			@note = Note.find(params[:id])
		end

		def note_params
			params.require(:note).permit(:title, :content)
		end

end
