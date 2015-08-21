class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end

  # GET /pins/new
  # Create a new pin
  def create
    #@pin = Pin.new(pin_params)
    @pin = Pin.new(params)
  end

  def show
    @pin = Pin.find(params[:id])
  end
  
  private
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :resource_type)
  end

  # Search for a Pin using the slug in the URL
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

end