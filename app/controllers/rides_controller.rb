class RidesController < ApplicationController
  def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    @alert = @ride.take_ride
    # flash[:notice] = 'Successfully checked in'
    # redirect_to user_path(@ride.user)
    redirect_to user_path(@ride.user), :alert => @alert
  end
end
