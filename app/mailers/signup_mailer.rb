class SignupMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_user_email(user)
    @user = user
    @url = "http:3000//example.com/login@u"
    mail(to: @user.email, subject: 'Welcome')
  end

end
