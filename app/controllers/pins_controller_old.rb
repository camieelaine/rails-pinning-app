class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end

  # GET /pins/new
  def new
    @pin = Pin.new
    #new_pin_path
  end
  
  # Create a new pin
  def create
    @pin = Pin.new(params)
  end


  def show
    @pin = Pin.find(params[:id])
  end
  
  # Search for a Pin using the slug in the URL
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

end