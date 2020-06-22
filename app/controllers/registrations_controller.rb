class RegistrationsController < Devise::RegistrationsController
    # private

    # def signup_params
    #     params.require(:user).permit(:username, :email, :password, :password_confirmation)
    # end 

    # def account_update_params
    #     params.require(:user).permit(:username, :email, :password, :password_confirmation)
    # end 

    before_action :configure_permitted_parameters, if: :devise_controller? 
    
    protected 
    def configure_permitted_parameters    
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])  
    end

end
