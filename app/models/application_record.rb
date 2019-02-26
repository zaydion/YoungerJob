class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def default_url_options
    { locale: I18n.locale }
  end
end
