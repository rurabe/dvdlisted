class PeopleController < ApplicationController
	before_filter :set_person, :only => [:show, :edit, :update, :destroy]

  def index
  	@people = Person.all
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new(params[:person])
  	if @person.save
  		redirect_to @person
  	else
  		flash[:error] = @person.errors.full_messages
  		render 'people/new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @person.update_attributes(params[:person])
  		redirect_to @person
  	else
  		flash[:error] = @person.errors.full_messages
  		render 'people/edit'
  	end
  end

  def destroy
  	@person.destroy
  	redirect_to root_path
  end

  def set_person
  	@person = Person.find(params[:id])
  end
end
