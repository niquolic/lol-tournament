class SessionsController < ApplicationController
  def new
  end

  def create
    admin = AdminUser.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin_user_id] = admin.id
      redirect_to root_path, notice: "Connecté avec succès."
    else
      flash.now[:alert] = "Email ou mot de passe incorrect"
      render :new
    end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to root_path, notice: "Déconnecté."
  end
end
