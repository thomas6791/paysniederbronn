class RentingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.renting_mailer.rentingask.subject
  #
  def rentingask
    #@annonce = params[:annonce] # Instance variable => available in view
    mail(to: params[:annonce_email], subject: 'Demande de location')
    # This will render a view in `app/views/user_mailer`!
  end
end
