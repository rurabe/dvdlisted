class DirectorsController < ApplicationController
	before_filter :set_person, :only => [:show, :edit, :update, :destroy]
	before_filter :set_type, :only => [:index, :new, :show, :edit]

	def index
  	@people = Person.director
  	render 'people/index'
	end

	def new
  	@person = Person.new
  	@action = 'create'
  	render 'people/new'
	end

	def create
    dvd_id = params[:person].delete(:dvd)
		@person = Person.new(params[:person])
  	if @person.save
      if dvd_id
        create_role_too(dvd_id)
      else
  		  redirect_to director_path(@person)
      end
  	else
  		flash[:error] = @person.errors.full_messages
  		redirect_to :back
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

  def create_role_too(dvd_id)
    role = Role.new(:dvd_id => dvd_id, :person_id => @person.id, :role_type => 'director') 
    unless role.save
      flash[:error] = role.errors.full_messages
    end
    redirect_to dvd_path(dvd_id)
  end

	def set_person
  	@person = Person.find(params[:id])
  end

  def set_type
		@type = params[:controller].singularize
  end
end
