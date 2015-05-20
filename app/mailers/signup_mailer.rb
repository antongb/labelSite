class SignupMailer < ApplicationMailer
  default from: 'noreply@honeybae.com'

  def new_user_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome')
  end

end
