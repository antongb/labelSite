class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if @email.save
      # SignupMailer.new_user_email(@email).deliver_later
      # send_mail
      flash[:notice] = 'Thanks for registering!'
      redirect_to root_url
      MailingList.mail_list.deliver
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

  def send_mail
    MailingList.mail_list.deliver
    SignupMailer.new_user_email(@email).deliver
    # SendEmailJob.set(wait: 5.seconds).perform_later(@email)
  end
end
