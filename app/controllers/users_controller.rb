class UsersController < ApplicationController
  before_action :check_login

  def manage
    @customers = current_user.customers.page(params[:page]).per Settings.show_limit.show_12
  end
end
