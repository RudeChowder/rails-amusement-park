class RidesController < ApplicationController
  def index

  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      flash[:info] = @ride.take_ride
      redirect_to @ride.user
    else
      redirect_to attraction_path(params[:attraction_id])
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
