module Hugo
  class ConfigFile < BaseFile
    def relative_path
      'config.json'
    end

    def content
      {
        baseUrl: "https://#{deployment_target.public_hostname}",
        languageCode: site.language_code,
        title: site.title,
        summaryLength: site.summary_length,
        params: { emoji: site.emoji },
        theme: site.theme.hugo_theme,
        menu: {
          main: pages
        }
      }.to_json
    end

    def pages
      i = 1
      site.pages.where.not(slug: '/').map do |page|
        {
          name: page.title,
          url: page.slug,
          weight: i += 1,
          params: {
            emoji: page.emoji
          }
        }
      end
    end
  end
end
