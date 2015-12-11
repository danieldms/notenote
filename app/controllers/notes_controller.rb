class NotesController < ApplicationController

	before_action :find_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = Note.all.order("created_at DESC")
	end

	def show
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)

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
	end

	def destroy
	end

	private
		
		def find_note
			@note = Note.find(params[:id])
		end

		def note_params
			params.require(:note).permit(:title, :content)
		end

end
