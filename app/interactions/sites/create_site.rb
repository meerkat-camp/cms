module Sites
  class CreateSite < ActiveInteraction::Base
    string :title
    object :current_user, class: User

    validates :title, presence: true

    def execute
      site = Site.new(title:)

      add_default_theme(site)

      if site.save
        current_user.sites << site
        add_home_page(site)
        create_staging(site)
      else
        errors.merge!(site.errors)
      end

      site
    end

    private

    def create_staging(site)
      site.deployment_targets.create!(
        public_hostname: "#{site.public_id}.stage.#{ENV.fetch('BASE_HOSTNAME_AND_PORT')}",
        type: :staging, provider: :internal
      )
    end

    def add_home_page(site)
      site.pages.create(title: 'Home', slug: '/')
    end

    def add_default_theme(site)
      site.theme = Theme.find_by(hugo_theme: 'simple_emoji')
    end
  end
end
