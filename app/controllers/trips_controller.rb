class TripsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trips = Trip.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
    @prefectures = Trip.all
    gon.visited_prefectures = @prefectures.map do |prefecture|
      prefecture.prefecture_before_type_cast
    end
    unless @group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @trip = Trip.new
    unless @group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.group_id = (params[:group_id])
    if @trip.save
      redirect_to group_trips_path
    else
      @group = Group.find(params[:group_id])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @group = Group.find(params[:group_id])
    unless @trip.group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to group_trips_path
    else
      @group = Group.find(params[:group_id])
      render :edit, status: :unprocessable_entity
    end
  end

  def prefecture
    @prefecture = Trip.create(prefecture: params[:id].to_i)
    @trips = Trip.where(prefecture: @prefecture.prefecture)
    gon.spots = Spot.where(prefecture: @prefecture.prefecture)
    gon.spots_latitudes = Spot.where(prefecture: @prefecture.prefecture).pluck(:latitude)
    gon.spots_longitudes = Spot.where(prefecture: @prefecture.prefecture).pluck(:longitude)
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :prefecture, :start_date, :end_date)
  end
end
