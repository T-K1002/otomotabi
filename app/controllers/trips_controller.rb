class TripsController < ApplicationController
  def index
    @trips = Trip.where(group_id: params[:group_id])
  end

  def show
  end

  def edit
  end

  def new
    @group = Group.find(params[:group_id])
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.group_id = (params[:group_id])
    if @trip.save
      redirect_to group_trips_path
    else
      render :new
    end
  end

  private

  def trips
    params.require(:trip).permit(:title)
  end
end
