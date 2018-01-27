class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "shuji_tominaga@diveintocode.jp", subject: "お問い合わせの確認ツール"
  end
end
