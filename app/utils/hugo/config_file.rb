module Hugo
  class ConfigFile < BaseFile
    def relative_path
      'config.json'
    end

    def content
      {
        baseUrl: "https://#{deployment_target.public_hostname}/",
        languageCode: site.language_code,
        title: site.title,
        summaryLength: site.summary_length,
        params: { emoji: site.emoji, social: },
        theme: site.theme.hugo_theme,
        menu: {
          main: main_navigation
        },
        markup: {
          highlight: {
            guessSyntax: true,
            lineNos: true,
            lineNumbersInTable: true,
            style: "monokai",
            tabWidth: 2
          }
        }
      }.to_json
    end

    def main_navigation
      site.main_navigation.navigation_items.map do |item|
        {
          name: item.title,
          url: item.slug,
          weight: item.position,
          params: {
            emoji: item.emoji
          }
        }
      end
    end

    def social
      site.social_media_links.map { |l| { name: l.name, url: l.url, icon: l.icon, svg: l.svg } }
    end
  end
end
