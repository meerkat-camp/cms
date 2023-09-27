module Hugo
  class PageFile < BaseFile
    def relative_path
      if object.slug == '/'
        'content/_index.html'
      else
        "content/pages/#{object.id}.html"
      end
    end

    def content
      front_matter = {
        layout: object.slug == '/' ? 'home' : 'page'
      }

      front_matter[:menu] = 'main' if object.slug != '/'
      front_matter[:short] = true if object.title.blank?
      front_matter[:title] = object.title if object.title.present?
      front_matter[:emoji] = object.emoji if object.emoji.present?

      [front_matter.to_json, object.content_html].join("\n\n")
    end
  end
end
