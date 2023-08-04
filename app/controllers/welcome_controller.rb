class WelcomeController < ApplicationController
  layout 'layouts/devise/devise'
  skip_before_action :authenticate_user!, only: [:index]
  before_action :redirect_logged_in_users

  def index; end

  private

  def redirect_logged_in_users
    redirect_to home_path if user_signed_in?
  end

end
