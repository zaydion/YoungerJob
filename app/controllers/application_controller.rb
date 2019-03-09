class ApplicationController < ActionController::Base
  include SessionsHelper

  def default_url_options
    { locale: I18n.locale }
  end
end
