class TicketsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_project
  before_filter :find_ticket, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]
  def new
    #@ticket = Ticket.new(:project_id => @project.id)
    #ó
    @ticket = @project.tickets.build
    3.times { @ticket.assets.build }

    
  end
  
  def show
    #@ticket = Tickets.find(params[:id])
  end
  
  def edit
    
  end
  
  def destroy
    
    @ticket.destroy
    flash[:success] = "Ticket has been deleted."
    redirect_to @project
    
  end

  def update
    
    if @ticket.update_attributes(params[:ticket])
      flash[:success] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:error] = "Ticket has not been updated."
      render :action => "edit"  
    end
  end
  def create
    
    #@ticket = @project.tickets.build(params[:ticket])
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    
    if @ticket.save
      flash[:success] = "Ticket has been created."
      redirect_to [@project,@ticket]
    else
      flash[:error] = "Ticket has not been created."
      render :action => "new"
    end
    
  end
  private
  def find_project
    @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
    flash[:error] = "The project you were looking" +
    " for could not be found."
    redirect_to projects_path
  end
  
  private
  def find_ticket
  @ticket = @project.tickets.find(params[:id])
  end
end
