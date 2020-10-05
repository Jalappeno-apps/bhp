class ContactFormMailerPreview < ActionMailer::Preview
  def inquiry_email
    ContactFormMailer.inquiry_email(
      "user_email", "user_name", "company_name", "nip", "message", "test@example.com"
    )
  end
end
