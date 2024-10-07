module Sites
  class UpdateSite < ActiveInteraction::Base
    object :site, class: Site
    object :current_user, class: User

    string :title
    validates :title, presence: true

    string :theme_id, presence: true, inclusion: { in: Theme.pluck(:id) }

    string :language_code
    validates :language_code, presence: true, inclusion: {
      in: Form::LanguageSelectComponent::Codes::ISO_CODES
    }

    object :domain, class: DomainNormalizer, converter: :new
    validates :domain, presence: true, format: {
      with: /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/i
    }

    def execute
      site.assign_attributes(title:, language_code:, domain:, theme_id:)

      errors.merge!(site.errors) unless site.save

      site
    end
  end
end
