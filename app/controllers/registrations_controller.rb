class RegistrationsController < Devise::RegistrationsController
  def details
    @user = user_session
  end

  private

  def sign_up_params
    params.require(:user).permit :name, :phone, :address, :avatar, :email, :password, :password_confirmation
  end

  def account_update_params
    params.require(:user).permit :name, :phone, :address, :avatar, :email, :password, :password_confirmation, :current_password
  end
end
