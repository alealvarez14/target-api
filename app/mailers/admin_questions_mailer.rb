class AdminQuestionsMailer < ApplicationMailer
  default to: 'admin@target.com'

  def admin_questions(email, subject, body)
    @body = body
    mail(from: email, subject: subject)
  end
end
