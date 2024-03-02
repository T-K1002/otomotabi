class TripsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trips = Trip.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
    if @group.group_users != current_user.group_users
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
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

  def trip_params
    params.require(:trip).permit(:title, :start_date, :end_date)
  end
end
