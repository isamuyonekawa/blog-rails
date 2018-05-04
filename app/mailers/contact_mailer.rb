class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: 'sutesutesute3@outlook.jp', subject: 'blog-railsお問い合わせ内容'
  end
end
