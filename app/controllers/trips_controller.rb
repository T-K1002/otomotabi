class TripsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trips = Trip.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
    gon.group_id = @group.id
    gon.visited_prefectures = @trips.map do |trip|
      trip.prefecture_before_type_cast
    end
    unless @group.users.include?(current_user)
      redirect_to groups_path, alert: "不正なアクセスです。"
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @group = Group.find(params[:group_id])
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
    @group = Group.find(params[:group_id])
    if @trip.save
      redirect_to group_trip_spots_path(@group, @trip), notice: "新しい旅行計画を作成しました。"
    else
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
    @group = Group.find(params[:group_id])
    if @trip.update(trip_params)
      redirect_to "/groups/#{@group.id}/prefectures/#{@trip.prefecture_before_type_cast}", notice: "旅行計画を編集しました。"
    else
      @group = Group.find(params[:group_id])
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @group = Group.find(params[:group_id])
    @trip.destroy
    redirect_to "/groups/#{@group.id}/prefectures/#{@trip.prefecture_before_type_cast}", alert: "旅行計画を削除しました。"
  end

  def prefecture
    @prefecture = Spot.create(prefecture: params[:id].to_i)
    @group = Group.find(params[:group_id])
    @trips = Trip.where(prefecture: @prefecture.prefecture, group_id: @group.id)
    @spots = Spot.where(prefecture: @prefecture.prefecture, group_id: @group.id)
    @recommend = Recommend.new
    gon.spots = Spot.where(prefecture: @prefecture.prefecture, group_id: @group.id)
    gon.spots_latitudes = Spot.where(prefecture: @prefecture.prefecture, group_id: @group.id).pluck(:latitude)
    gon.spots_longitudes = Spot.where(prefecture: @prefecture.prefecture, group_id: @group.id).pluck(:longitude)
    gon.prefecture = Spot.create(address: @prefecture.prefecture)
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :prefecture, :start_date, :end_date, :image)
  end
end
