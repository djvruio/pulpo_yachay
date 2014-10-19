class GoalsController < ApplicationController
  def create
<<<<<<< HEAD
    binding.pry
    @goal = current_user.goals.build(goals_params)
    if @goal.save
      flash[:success] = "Objetivo creado!"
      redirect_to root_url
    else
      render 'visitors/index'
=======
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
>>>>>>> MyArm
    end
  end

  def index
<<<<<<< HEAD
    @goals_index=Goal.all
=======
    @goals = Goal.all
>>>>>>> MyArm
  end

  def new
    @goal = Goal.new
  end

  private

  def goals_params
    params.require(:goal).permit(:name, :organization_id)
  end
end
