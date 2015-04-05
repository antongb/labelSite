class MailingList < ApplicationMailer
  default from: 'notifications@example.com'

  def mail_list
    email_arr = []
    Email.all.each { |e| email_arr << e.email + ";" }
    @email_string = email_arr.join(" ")

    @url = "http:3000//example.com/email"
    mail(to: 'shainanton@gmail.com', subject: 'email list')
  end

end
