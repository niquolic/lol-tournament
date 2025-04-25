class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_admin_user, :admin_signed_in?

  def current_admin_user
    @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])
  end

  def admin_signed_in?
    current_admin_user.present?
  end

  def authenticate_admin!
    redirect_to new_session_path, alert: "Vous devez être connecté comme admin." unless admin_signed_in?
  end
end
