class ApplicationMailer < ActionMailer::Base
  before_action :set_default_url_options

  default from: 'login@meerkat.camp'
  layout 'mailer'

  private

  def set_default_url_options
    self.default_url_options = {
      host: "#{ENV.fetch('HTTPS') == 'true' ? 'https' : 'http'}://#{site.internal_subdomain}.#{ENV.fetch('BASE_HOSTNAME_AND_PORT')}"
    }
  end

  def site
    params[:site]
  end

  def user
    params[:user]
  end
end
