class StatisticsController < ApplicationController
 def show
    if current_user.admin? 
      @projects = Project.all
    else
      @projects = current_user.projects
    end  	
  end

  def index
    if current_user.admin? 
      @projects = Project.all
    else
      @projects = current_user.projects
    end       
  end 
  
  def details
  end	
end
