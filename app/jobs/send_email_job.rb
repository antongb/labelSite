class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    # Do something later
    @user = user
    SignupMailer.new_user_email(@user).deliver_later
  end
end
