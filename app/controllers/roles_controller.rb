class RolesController < ApplicationController

	def create
		@role = Role.new(params[:role])
		@role.save
		redirect_to :back
	end
end
