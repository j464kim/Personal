class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  #Read All
  def index
    @pins = Pin.all
  end

  # Read action
  def show
  end

  def new
    @pin = Pin.new
    # @pin = current_user.pins.build
  end

  def edit
  end

  # New + create
  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.' 
    else
      render :new 
    end
  end
  # Edit + update
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
      else
        render :edit 
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      redirect_to pins_url, notice: 'Pin was successfully destroyed.'
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end



