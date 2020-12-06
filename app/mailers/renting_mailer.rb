class RentingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.renting_mailer.rentingask.subject
  #
  def rentingask
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
