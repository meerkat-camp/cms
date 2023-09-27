require 'pathname'

module Hugo
  class BaseFile
    attr_reader :site, :object

    def initialize(object)
      @site = object.site
      @object = object
    end

    def write
      hugo_dir = Rails.root.join('tmp', 'hugo', site.id.to_s)
      file_path = File.join(hugo_dir, relative_path)
      file_path = normalized_path!(file_path)
      FileUtils.mkdir_p(File.dirname(file_path))

      Rails.logger.info "Writing file: #{file_path}\n#{content}"
      File.write(File.join(hugo_dir, relative_path), content)
    end

    protected

    def normalized_path!(path)
      path_name = Pathname.new(path)
      normalized_path = path_name.cleanpath.to_s

      raise "Invalid file path: #{path}" unless normalized_path.start_with?(hugo_dir.to_s)

      normalized_path
    end

    def relative_path
      raise NotImplementedError
    end

    def content
      raise NotImplementedError
    end

    def hugo_dir; end
  end
end
