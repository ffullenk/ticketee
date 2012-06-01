class FilesController < ApplicationController
  before_filter :authenticate_user!
  def show
    
    asset = Asset.find(params[:id])
    send_file asset.asset.path, :filename=> asset.asset_file_name,:content_type => asset.asset_content_type
  end
end
