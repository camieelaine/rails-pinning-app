class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end

  def show
    #@pin = Pin.find(pin_params)
    @pin = Pin.find(params[:id])
  end


  # Search for a Pin using the slug in the URL
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

# GET /pins/new
  def new
    @pin = Pin.new
    #new_pin_path
  end
  
  # Create a new pin
  def create
    @pin = Pin.create(pin_params)
    #@pin = Pin.create(params[:pin])
    if @pin.valid?
      @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
  end
  
    private
    def pin_params
      params.require(:pin).permit(:title, :url, :slug, :text, :category_id)
    end

  
end