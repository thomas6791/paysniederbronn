class TestMailer < ApplicationMailer

  default from: 'contact@paysniederbronn.fr'

  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'contact@paysniederbronn.fr',
      from: 'contact@paysniederbronn.fr',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound')
  end
end
