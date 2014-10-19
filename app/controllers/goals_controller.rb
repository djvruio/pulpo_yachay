class GoalsController < ApplicationController
  def create
    #binding.pry
    @goal = Goal.new(goals_params)
    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_path , notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  private

  def goals_params
    params.require(:goal).permit(:name, :organization_id)
  end
end
