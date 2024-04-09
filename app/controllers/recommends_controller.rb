class RecommendsController < ApplicationController
  def show
    @recommend = Recommend.find(params[:id])
  end

  def create
    @recommend = Recommend.new(recommend_params)

    if @recommend.save
      redirect_to @recommend
    else
      render :new
    end
  end

  private

  def recommend_params
    params.require(:recommend).permit(:content, :genre, :prefecture)
  end
end
