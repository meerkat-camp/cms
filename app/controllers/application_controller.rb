class ApplicationController < ActionController::Base
  before_action :set_site
  before_action :authenticate!

  helper_method :current_user

  def set_site
    @site = Site.find_by(internal_subdomain:)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def authenticate!
    current_user || redirect_to(login_path)
  end

  def login(user)
    user.touch(:last_login_at)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def internal_subdomain
    domain_parts = request.hostname.split('.')

    is_local_subdomain = domain_parts.count == 2 && domain_parts.last == 'localhost'
    return domain_parts.first if is_local_subdomain

    request.subdomain
  end

  def render_json(template)
    render template, formats: [:json], handlers: [:jbuilder], layout: false
  end
end
