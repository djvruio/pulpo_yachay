class GoalsController < ApplicationController
  def create
    #binding.pry
    @goal = current_user.goals.build(goals_params)
    if @goal.save
      flash[:success] = "Objetivo creado!"
      redirect_to root_url
    else
      render 'visitors/index'
    end
  end

  def index

  end

  def new
    @goal = Goal.new
  end

  private

  def goals_params
    params.require(:goal).permit(:name, :organization_id)
  end
end
