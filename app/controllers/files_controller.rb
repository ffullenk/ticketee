class FilesController < ApplicationController
  before_filter :authenticate_user!
  def show
    
    asset = Asset.find(params[:id])
    send_file asset.asset.path, :filename=> asset.asset_file_name,:content_type => asset.asset_content_type
  end
  
  # def new
    # asset = Asset.new
    # render :partial => "files/form",
    # :locals => { :number => params[:number].to_i,
    # :asset => asset }
# 
#     
    # @ticket = Ticket.new
    # asset = @ticket.assets.build
# 
  # end
  def new
    asset = Asset.new
    @ticket = Ticket.new
    @ticket.assets.build
    render :partial => "files/form", :locals => { :number => params[:number].to_i, :asset => asset }
  end

end
