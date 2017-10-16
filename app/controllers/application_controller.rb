class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  def current_seller
    @current_seller ||= current_user.seller
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
