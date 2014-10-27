class ProjectsController < ApplicationController
	
	before_filter :authenticate_user!
	respond_to :html, :xml, :json
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
    if current_user.admin?
      case params[:scope]
        when 'open'
          @projects = Project.open
        when 'closed'
          @projects = Project.closed
        when 'suspended'
          @projects = Project.suspended
        when 'transferred'
          @projects = Project.transferred
        when 'open_is_strategic'
          @projects = Project.open.where('is_strategic = ?',true)
        when 'open_is_not_strategic'
          @projects = Project.open.where('is_strategic = ?',false)
        when 'closed_is_strategic'
          @projects = Project.closed.where('is_strategic = ?',true)
        when 'closed_is_not_strategic'
          @projects = Project.closed.where('is_strategic = ?',false)
        when 'open_is_critic'
          @projects = Project.open.where('is_critic = ?',true)
        when 'open_is_not_critic'
          @projects = Project.open.where('is_critic = ?',false)
        when 'closed_is_critic'
          @projects = Project.closed.where('is_critic = ?',true)
        when 'closed_is_not_critic'
          @projects = Project.closed.where('is_critic = ?',false)
        else
          @projects = Project.all
      end
    end
    if current_user.user?
      case params[:scope]
        when 'open'
          @projects = current_user.projects.open
        when 'closed'
          @projects = current_user.projects.closed
        when 'suspended'
          @projects = current_user.projects.suspended
        when 'transferred'
          @projects = current_user.projects.transferred
        when 'open_is_strategic'
          @projects = current_user.projects.open.where('is_strategic = ?',true)
        when 'open_is_not_strategic'
          @projects = current_user.projects.open.where('is_strategic = ?',false)
        when 'closed_is_strategic'
          @projects = current_user.projects.closed.where('is_strategic = ?',true)
        when 'closed_is_not_strategic'
          @projects = current_user.projects.closed.where('is_strategic = ?',false)
        when 'open_is_critic'
          @projects = current_user.projects.open.where('is_critic = ?',true)
        when 'open_is_not_critic'
          @projects = current_user.projects.open.where('is_critic = ?',false)
        when 'closed_is_critic'
          @projects = current_user.projects.closed.where('is_critic = ?',true)
        when 'closed_is_not_critic'
          @projects = current_user.projects.closed.where('is_critic = ?',false)
        else
          @projects = current_user.projects.all
      end
    end
	end

	def show
    @openS = Project.open.where('is_strategic = ?',true)
    @openNS = Project.open.where('is_strategic = ?',false)
    @ClosedS = Project.closed.where('is_strategic = ?',true)
    @ClosedNS = Project.closed.where('is_strategic = ?',false)

    @goals = @project.goals
		respond_with(@project, @goals)
		#@goals = @project.goals
	end

	def new
	    @project = Project.new
	    respond_with(@project)
      
  	end

  	def edit
      @membership = Membership.all
  	end
  	
  	def create
	    @project = Project.new(project_params)
	    flash[:notice] = 'Project was successfully created.' if @project.save
	    respond_with(@project)
  	end

  	def update
  		flash[:notice] = 'Project was successfully updated.' if @project.update(project_params)
  		respond_with(@project)
  	end

  	def destroy
  		@project.destroy
  		respond_with(@project)
  	end


  	private

	    def set_project
	      @project = Project.find(params[:id])
	    end

	    def project_params
	      params.require(:project).permit(:name, :description, :price, :is_strategic, :status,:is_critical,:alias, :goal_ids=>[])
	    end
end
