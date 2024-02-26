class TravelPlansController < ApplicationController
  def index
    @travel_plans = TravelPlan.where(group_id: params[:group_id])
  end

  def show
  end

  def edit
  end

  def new
    @group = Group.find(params[:group_id])
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = TravelPlan.new(travel_plan_params)
    @travel_plan.group_id = (params[:group_id])
    if @travel_plan.save
      redirect_to group_travel_plans_path
    else
      render :new
    end
  end

  private

  def travel_plan_params
    params.require(:travel_plan).permit(:title)
  end
end
