class DvdsController < ApplicationController
  before_filter :set_dvd, :only => [:show, :edit, :update, :destroy]

  def index
    @dvds = Dvd.order(:name)
  end

  def new
    @dvd = Dvd.new
  end

  def create
    @dvd = Dvd.new(params[:dvd])
    if @dvd.save
      redirect_to @dvd
    else
      flash[:error] = @dvd.errors.full_messages
      render 'dvds/new'
    end
  end

  def show
    @person = Person.new
    @role = Role.new
  end

  def edit
    
  end

  def update
    if @dvd.update_attributes(params[:dvd])
      redirect_to @dvd
    else
      flash[:error] = @dvd.errors.full_messages
      render 'dvds/edit'
    end
  end

  def destroy
    @dvd.destroy
    redirect_to root_path
  end



  def set_dvd
    @dvd = Dvd.find(params[:id])
  end
end
