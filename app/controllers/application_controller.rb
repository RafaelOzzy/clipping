class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "Acesso negado!"
    end
  end

  def after_sign_in_path_for(resource)
    newsletters_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cnpj, :company])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cnpj, :company])
  end
end
