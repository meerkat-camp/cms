module Hugo
  class PostFile < BaseFile
    def relative_path
      "content/posts/#{object.public_id}.html"
    end

    def content
      [front_matter.to_json, object.hugo_html].join("\n\n")
    end

    private

    def front_matter
      front_matter = { date: object.created_at.strftime('%Y-%m-%d') }

      front_matter[:short] = true if object.title.blank?
      front_matter[:title] = object.title if object.title.present?
      front_matter[:emoji] = object.emoji if object.emoji.present?
      front_matter
    end
  end
end
