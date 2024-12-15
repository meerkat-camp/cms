module Sites
  class UpdateSite
    extend LightService::Action

    expects :emoji, :site, :title, :theme_id, :language_code, :domain

    executed do |context|
      context.site.assign_attributes(
        emoji: context.emoji,
        title: context.title,
        language_code: context.language_code,
        domain: context.domain,
        theme_id: context.theme_id
      )

      context.fail_and_return!(context.site.errors.full_messages.join(", ")) unless context.site.save
    end
  end
end
