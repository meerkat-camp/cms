class UserMailer < ApplicationMailer
  def login
    @token = user.generate_token_for(:email_login)
    mail to: user.email
  end
end
