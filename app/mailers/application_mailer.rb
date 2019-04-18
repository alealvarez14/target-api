class ApplicationMailer < ActionMailer::Base
  default to: 'admin@target.com'
  layout 'mailer'

  def email_admin(email, subject, body)
    @body = body
    mail(from: email, subject: subject)
  end
end
