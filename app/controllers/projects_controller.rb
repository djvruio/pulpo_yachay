class ProjectsController < ApplicationController
	
	before_filter :authenticate_user!
	respond_to :html, :xml, :json
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	
	def index
		case params[:scope]
		when 'open'
			@projects = Project.open
		when 'closed'
			@projects = Project.closed
		when 'suspended'
			@projects = Project.suspended
		when 'transferred'
			@projects = Project.transferred
		else
			@projects = Project.all
		end
	end

	def show
		respond_with(@project)
	end

	def new
	    @project = Project.new
	    respond_with(@project)
  	end

  	def edit
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
	      params.require(:project).permit(:name, :description, :estimated_budget, :is_strategic, :status)
	    end
end
