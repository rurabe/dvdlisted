class PeopleController < ApplicationController
	before_filter :set_person, :only => [:show, :edit, :update, :destroy]

  def index
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

  end

  def destroy

  end

  def set_person
  	@person = Person.find(params[:id])
  end
end
