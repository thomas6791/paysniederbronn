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
    if @locale_url[0..2] == "/fr"
      @locale_url = @locale_url.remove("/fr")
    elsif @locale_url[0..2] == "/en"
      @locale_url = @locale_url.remove("/en")
    elsif @locale_url[0..2] == "/de"
      @locale_url = @locale_url.remove("/de")
    end
  end
end
