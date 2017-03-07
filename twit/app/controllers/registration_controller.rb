class RegistrationController < Devise::RegistrationsController

    def avatar
        @user = current_user
    end


    private

    def sign_up_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation, :avatar)
    end

    def account_update_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation, :current_password, :avatar)
    end
end
