class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def show
    user = @site.users.find_by_token_for(:email_login, params[:token])
    login(user) if user.present?
    redirect_to root_path
  end

  def new; end

  def create
    user = @site.users.find_by(email: params[:email])
    UserMailer.with(user:, site: @site).login.deliver_later if user.present?
  end

  def destroy
    logout
  end
end
