class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :redirect_logged_in_users

  def root
  end

  def redirect_logged_in_users
    redirect_to events_path if user_signed_in?
  end
  hide_action :redirect_logged_in_users
end
