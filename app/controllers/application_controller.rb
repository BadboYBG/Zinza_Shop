class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include CartsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :menu
  before_action :create_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
  end

  def menu
  	@categories = Category.all
  end

  def create_session
    session[:order_items] ||= Hash.new
    session[:time] ||= Hash.new
  end
  
  def check_login
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
