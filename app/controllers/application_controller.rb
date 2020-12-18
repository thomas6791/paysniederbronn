class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :open_graph

  private
  def set_locale
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
  end

  def default_url_options(options={})
     logger.debug "default_url_options is passed options: #{options.inspect}\n"
     { locale: I18n.locale }
  end

  def open_graph
    set_meta_tags og: {
      title:    'Pays de Niederbronn-les-Bains',
      type:     'website',
      url:      'https://wwww.paysniederbronn.fr',
      image:    'https://www.paysniederbronn.fr/fr/assets/images/opengraph.png'
    }
  end
end
