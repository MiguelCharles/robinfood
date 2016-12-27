class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :store_current_location, :unless => :devise_controller?
  before_action :set_locale
  include Pundit

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def change_language
  cookies[:language] = params[:language]

  redirect_to :back
  end

private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)

  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
