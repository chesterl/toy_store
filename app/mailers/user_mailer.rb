class UserMailer < ApplicationMailer
  default from: "hello@toytastic.com"

  def new_message(from_id, to_id)
    @user = User.find(from_id)
    @to = User.find(to_id)

    mail(to: @to.email, subject: "You have a new message from #{@to.name}")
  end
end
