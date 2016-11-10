
class AddressesController < ApplicationController
  before_action :set_trip
  before_action :set_location
  before_action :set_address, except: [:index, :new, :create]


  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      redirect_to  trip_location_address_path(@trip, @location, @address)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_location_addresses_path(@trip, @location)
  end

  private
  def address_params
    params.require(:address).permit(:country, :city,
                                      :state, :zip, :location_id) 
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find(params[:id])
    # @address = Address.find_by(id: params[:id])
  end

end