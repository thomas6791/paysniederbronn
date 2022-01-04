class RentingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.renting_mailer.rentingask.subject
  #
  def rentingask
    @annonce_email = params[:annonce_email]
    @annonce_titre = params[:annonce]
    @start_rent = params[:start_rent]
    @end_rent = params[:end_rent]
    @address = params[:address]
    @user_name = params[:user_name]
    @email = params[:email]
    @tel = params[:tel]
    @adults = params[:adults]
    @kids = params[:kids]
    @message = params[:message]
     # Instance variable => available in view
    mail(to: @annonce_email, reply_to: @email, subject: 'Demande de location')
    # This will render a view in `app/views/user_mailer`!
  end
end
