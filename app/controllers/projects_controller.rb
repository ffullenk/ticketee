class ProjectsController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_project, :only => [:show,:edit,:update,:destroy]

	def index
	 @projects = Project.all
	end
	
	def new
		@project = Project.new
	end
  
	def create
	  @project = Project.new(params[:project])
	  if @project.save
      flash[:success] = "Project has been created."
      redirect_to @project
	  else
	    flash[:error] = "Project has not been created."
	    render :action => "new"
	  end
	    
	end
	
	def update
	  
	  if @project.update_attributes(params[:project])
	    flash[:success] = "Project has been updated"
	    redirect_to @project
	  else
	    flash[:error] = "Project has not been updated"
	    render :action => "edit"
	  end
	end
	
	def show
	    
	end
	
	def edit
	   
	end
	def destroy
    @project.destroy
    
    flash[:success] = "Project has been deleted"
    redirect_to projects_path
    
  end
  
  private
  def find_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:error] = "The project you were looking" +
    " for could not be found."
    redirect_to projects_path
  end
  
end
