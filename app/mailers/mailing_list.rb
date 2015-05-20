class MailingList < ApplicationMailer
  default from: 'noreply@honeybae.com'

  def mail_list
    email_arr = []
    Email.all.each { |e| email_arr << e.email + ";" }
    @email_string = email_arr.uniq.join(" ")

    mail(to: 'shainanton@gmail.com', subject: 'email list')
  end

end
