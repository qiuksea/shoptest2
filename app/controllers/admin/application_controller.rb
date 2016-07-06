class Admin::ApplicationController < ApplicationController
  #before_filter :authenticate_user!
  before_action :require_admin



  def require_admin
    unless current_user.try(:admin?)
      flash[:notice] = "You are not allowed to access the part."
      redirect_to root_path
    end
  end

end