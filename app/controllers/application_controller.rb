class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:user_name, :phone_number,:email, :password,:is_admin,:is_buyer,:is_seller) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:user_name, :phone_number,:email, :password,:is_admin,:is_buyer,:is_seller, :current_password, :profile_image) }
        end
end
