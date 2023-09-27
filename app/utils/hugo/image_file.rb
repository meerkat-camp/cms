module Hugo
  class ImageFile < BaseFile
    def relative_path
      "static/images/#{object.id}"
    end

    def content
      object.file.download
    end

    def write
      hugo_dir = Rails.root.join('tmp', 'hugo', site.id.to_s)
      file_path = File.join(hugo_dir, relative_path)
      file_path = normalized_path!(file_path)
      FileUtils.mkdir_p(File.dirname(file_path))

      Rails.logger.info "Writing file: #{file_path}\n#{content}"
      File.binwrite(File.join(hugo_dir, relative_path), content)
    end
  end
end
