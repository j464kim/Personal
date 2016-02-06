class PinsController < ApplicationController
  # before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.' 
    else
      render :new 
    end
  end
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
      format.html {redirect_to pins_url, notice: 'Pin was successfully destroyed.'}
      format.json { head :no_content }    
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # what you permit for the user to be able to update in the form
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end




