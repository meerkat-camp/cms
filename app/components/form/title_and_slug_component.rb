module Form
  class TitleAndSlugComponent < ViewComponent::Base
    attr_reader :form

    def initialize(form:)
      @form = form
    end

    def slugs_path
      helpers.api_site_slugs_path(form.object.site)
    end
  end
end
