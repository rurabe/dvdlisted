class RolesController < ApplicationController

	def create
		@role = Role.new(params[:role])
		unless @role.save
			flash[:error] = @role.errors.full_messages
		end
		redirect_to :back
	end

	def destroy
		@role = Role.where(:dvd_id => params[:dvd_id], 
											 :person_id => params[:person_id],
											 :role_type => params[:role_type]).first
		@role.destroy
		redirect_to :back
	end
end
