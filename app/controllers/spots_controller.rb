class SpotsController < ApplicationController
  before_action :authenticate_user!
  def new
    @trip = Trip.find(params[:trip_id])
    @spot = Spot.new
    @trip_dates = params[:trip_date]
    unless @trip.group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def index
    @trip = Trip.find(params[:trip_id])
    @dates = @trip.start_date + 1..@trip.end_date - 1
    unless @trip.group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.trip_id = (params[:trip_id])
    if @spot.save
      redirect_to group_trip_spots_path
    else 
      @trip_dates = @spot.date
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :start_time, :end_time, :date)
  end
end
