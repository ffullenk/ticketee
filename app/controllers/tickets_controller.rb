class TicketsController < ApplicationController
  
  before_filter :find_project
  before_filter :find_ticket, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]
  def new
    #@ticket = Ticket.new(:project_id => @project.id)
    #ó
    @ticket = @project.tickets.build
    
  end
  
  def show
    #@ticket = Tickets.find(params[:id])
  end
  
  def create
    
    @ticket = @project.tickets.build(params[:ticket])
    
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project,@ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
    
  end
  private
  def find_project
    @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking" +
    " for could not be found."
    redirect_to projects_path
  end
  
  private
  def find_ticket
  @ticket = @project.tickets.find(params[:id])
  end
end
