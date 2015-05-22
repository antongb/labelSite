class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if email_list?(@email.email)
      redirect_to root_url
      return
    end
    if is_valid?(@email.email) && @email.save
      flash[:notice] = 'Thanks for registering!'
      redirect_to root_url
      SignupMailer.new_user_email(@email).deliver
    else
      flash[:notice] = 'Sorry, something went wrong. Please try again.'
      redirect_to root_url
    end

  end


  private

  def email_params
    params.require(:email).permit(:email)
  end

  def is_valid?(email)
    valid_email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    match = (email =~ valid_email_regex)
    match == nil ? false : true
  end

  def send_mail
    SignupMailer.new_user_email(@email).deliver
  end

  def email_list?(email)
    if email == "earlyaccess@honeybae.com"
      MailingList.mail_list.deliver
      return true
    end
    false
  end
end
