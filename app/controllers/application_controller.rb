class ApplicationController < ActionController::Base
  #layout :layout_by_resource

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


  # private

  # def layout_by_resource
  #   if devise_controller?
  #     "layouts/login"
  #   else
  #     "application"
  #   end
  # end
end
