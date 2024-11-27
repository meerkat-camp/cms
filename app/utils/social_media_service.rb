class SocialMediaService
  SOCIAL_MEDIA_DATA = [
    { key: :facebook, name: 'Facebook', icon: 'facebook', url_placeholder: 'https://www.facebook.com/john.doe' },
    { key: :github, name: 'GitHub', icon: 'github', url_placeholder: 'https://github.com/johndoe' },
    { key: :gitlab, name: 'GitLab', icon: 'gitlab', url_placeholder: 'https://gitlab.com/johndoe' },
    { key: :instagram, name: 'Instagram', icon: 'instagram', url_placeholder: 'https://www.instagram.com/johndoe' },
    { key: :linkedin, name: 'LinkedIn', icon: 'linkedin', url_placeholder: 'https://www.linkedin.com/in/johndoe' },
    { key: :mastodon, name: 'Mastodon', icon: 'mastodon', url_placeholder: 'https://mastodon.social/@johndoe' },
    { key: :reddit, name: 'Reddit', icon: 'reddit', url_placeholder: 'https://www.reddit.com/user/johndoe' },
    { key: :rss, name: 'RSS', icon: 'rss', url_placeholder: 'https://example.com/feed.xml' },
    { key: :vimeo, name: 'Vimeo', icon: 'vimeo', url_placeholder: 'https://vimeo.com/johndoe' },
    { key: :whatsapp, name: 'WhatsApp', icon: 'whatsapp', url_placeholder: 'https://wa.me/1234567890' },
    { key: :youtube, name: 'YouTube', icon: 'youtube', url_placeholder: 'https://www.youtube.com/channel/UCjohndoe' }
  ].freeze

  extend ::Portrayal

  keyword :key
  keyword :name
  keyword :icon
  keyword :url_placeholder

  def self.all
    @all ||= SOCIAL_MEDIA_DATA.map { |data| new(**data) }
  end

  def self.find_each(&)
    all.each(&)
  end

  def svg
    @svg ||= Rails.root.join('vendor', 'icons', "#{icon}.svg").read
  end
end
