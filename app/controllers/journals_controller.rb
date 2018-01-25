class JournalsController < ApplicationController
before_action :find_journal, only: [:show, :edit, :update, :destroy]
	def index 
		@journals = Journal.where(user_id:current_user)
	end 

	def create
		@journal = current_user.journals.build(journal_params)
		if @journal.save
			redirect_to @journal
		else
			render 'new'
		end

	end

	def new
		@journal = current_user.journals.build
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
