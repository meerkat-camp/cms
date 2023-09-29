class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[new create show]
  skip_after_action :verify_pundit_checked

  def show
    user = User.find_by_token_for(:email_login, params[:token])
    login(user) if user.present?
    redirect_to root_path
  end

  def new; end

  def create
    user = User.find_by(email: params[:email])
    UserMailer.with(user:).login.deliver_later if user.present?
  end

  def destroy
    logout
  end
end
