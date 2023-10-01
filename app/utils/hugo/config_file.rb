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
        theme: 'simple_emoji'
      }.to_json
    end
  end
end
