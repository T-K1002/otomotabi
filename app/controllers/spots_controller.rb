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
    @group = Group.find(params[:group_id])
    @dates = @trip.start_date + 1..@trip.end_date - 1
    @spots = Spot.where(trip_id: params[:trip_id])
    gon.spots = Spot.where(trip_id: params[:trip_id]).order(:date, :start_time)
    gon.spots_latitudes = Spot.where(trip_id: params[:trip_id]).pluck(:latitude)
    gon.spots_longitudes = Spot.where(trip_id: params[:trip_id]).pluck(:longitude)
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
    @spot = Spot.find(params[:id])
    unless @spot.trip.group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to group_trip_spots_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :address, :start_time, :end_time, :date, :prefecture)
  end
end
