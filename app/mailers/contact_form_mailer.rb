class ContactFormMailer < ActionMailer::Base
  default from: 'kontakt@bhpartykuly.com'
  layout 'mailer'

  def inquiry_email(user_email, user_name, company_name, nip, message, mail_to)
    @email = user_email
    @name = user_name
    @message = message
    @company_name = company_name
    @nip = nip

    mail(
      to: mail_to, 
      subject: 'Inquiry from bhpartykuly'
    )
  end
end
