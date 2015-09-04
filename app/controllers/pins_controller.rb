class PinsController < ApplicationController
  before_action :require_login, :index, except: [:show, :show_by_name]

  def index
    #@pins = Pin.all
    @pins = current_user.pins
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

  # GET /pins/1/edit
  def edit
    @pin = Pin.find(params[:id])
    render :edit
    #edit_pin_path
  end

  #Method to update a pin record
  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    if @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :edit
    end
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
      @pin.user_id = current_user.id
      @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
  end
  
    private
    def pin_params
      params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
    end

  
end