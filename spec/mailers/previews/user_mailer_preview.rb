class UserMailerPreview < ActionMailer::Preview
  def login
    user = User.new(email: 'example.com')
    site = Site.new(internal_subdomain: 'example')
    UserMailer.with(user:, site:).login
  end
end
