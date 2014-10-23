class StatisticsController < ApplicationController
 def show
    if current_user.admin? 
      @projects = Project.all
    else
      @projects = current_user.projects
    end  	
  end

  def index
  end 
  
  def details
  end	
end
