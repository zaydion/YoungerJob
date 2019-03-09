class ApplicationController < ActionController::Base
  before_action :require_login
  include SessionHelper

  def require_login
    unless logged_in_as_user? || logged_in_as_company?
      flash[:error] = "Debes iniciar sesión para acceder a esta sección"
      redirect_back(fallback_location: root_path)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
