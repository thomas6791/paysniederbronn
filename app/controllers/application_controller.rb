class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_url

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  def set_url
    @locale_url = request.fullpath
  end
end
