class DirectorsController < ApplicationController
	before_filter :set_person, :only => [:show, :edit, :update, :destroy]
	before_filter :set_type, :only => [:index, :new, :show, :edit]

	def index
		# TODO move this to the person model
  	@people = Person.joins(:roles).where("roles.role_type" => "director")
  	render 'people/index'
	end

	def new
  	@person = Person.new
  	@action = 'create'
  	render 'people/new'
	end

	def create
		@person = Person.new(params[:person])
  	if @person.save
  		redirect_to director_path(@person)
  	else
  		flash[:error] = @person.errors.full_messages
  		render 'people/new'
  	end
  end

  def show
  	render 'people/show'
  end

  def edit
  	@role = Role.new
  	@action = 'update'
    render 'people/edit'
  end

	def update
		if @person.update_attributes(params[:person])
  		redirect_to director_path(@person)
  	else
  		flash[:error] = @person.errors.full_messages
  		render 'people/edit'
  	end
  end

  def destroy
  	@person.destroy
  	redirect_to directors_path
  end

	def set_person
  	@person = Person.find(params[:id])
  end

  def set_type
		@type = params[:controller].singularize
  end
end
