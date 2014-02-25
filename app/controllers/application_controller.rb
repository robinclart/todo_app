class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_user
  before_action :authentication_required

  private

  def authentication_required
    unless current_user
      redirect_to new_session_path
    end
  end

  def set_user
    @current_user = User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  attr_reader :current_user

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
