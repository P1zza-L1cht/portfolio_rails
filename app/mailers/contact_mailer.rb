class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @content = contact
    mail(
      to: @content.email,
      subject: 'ご連絡ありがとうございます'
    )
  end

  def eng_mail(contact)
    @content = contact
    mail(
      to: @content.email,
      subject: 'Thank you for your mail.'
    )
  end

  def to_admin(contact)
    @content = contact
    mail(
      to: Rails.application.credentials.gmail[:user_name],
      subject: 'お問い合わせメールが来ました(Portfolio)'
    )
  end 
end
