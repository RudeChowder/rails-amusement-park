class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin_required
    redirect_to :root unless current_user.admin
  end
end
