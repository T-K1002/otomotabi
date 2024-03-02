class SpotsController < ApplicationController
  before_action :authenticate_user!
  def new
    @trip = Trip.find(params[:trip_id])
    @spot = Spot.new
    @trip_dates = params[:trip_date]
    if @trip.group.group_users != current_user.group_users
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def index
    @trip = Trip.find(params[:trip_id])
    @dates = @trip.start_date + 1..@trip.end_date - 1
    if @trip.group.group_users != current_user.group_users
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.trip_id = (params[:trip_id])
    if @spot.save
      redirect_to group_trip_spots_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :start_time, :end_time, :date)
  end
end
