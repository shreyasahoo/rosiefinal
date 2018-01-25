class JournalsController < ApplicationController
before_action :find_journal, only: [:show, :edit, :update, :destroy]
	def index 
		@journals = Journal.all.order("created_at DESC")
	end 

	def create
		@journal = Journal.new(journal_params)
		if @journal.save
			redirect_to @journal
		else
			render 'new'
		end

	end

	def new
		@journal = Journal.new
	end

	def destroy
		@journal.destroy
		redirect_to journals_path
	end 

	def edit
	end

	def show
	end 

	def update
		if @journal.update(journal_params)
			redirect_to @journal
		else
			render 'edit'
		end
	end 

	private
	def find_journal
		@journal = Journal.find(params[:id])
	end

	def journal_params
		params.require(:journal).permit(:title, :date, :are_good, :are_bad, :anything_else)
	end

end
