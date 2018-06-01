class ApplicationController < ActionController::Base
  include CartsHelper
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :menu
  before_action :create_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone address avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone address avatar])
  end

  def menu
    @categories = Category.all
  end

  def create_session
    session[:order_items] ||= {}
    session[:time] ||= {}
  end

  def check_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
