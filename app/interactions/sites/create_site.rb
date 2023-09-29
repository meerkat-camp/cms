module Sites
  class CreateSite < ActiveInteraction::Base
    string :title
    object :current_user, class: User

    validates :title, presence: true

    def execute
      site = Site.new(title:)

      if site.save
        current_user.sites << site
        add_home_page(site)
      else
        errors.merge!(site.errors)
      end

      site
    end

    private

    def add_home_page(site)
      site.pages.create(title: 'Home', slug: '/')
    end
  end
end
