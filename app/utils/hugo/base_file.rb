require 'pathname'

module Hugo
  class BaseFile
    attr_reader :site, :object, :deployment_target

    def initialize(object, deployment_target)
      @site = deployment_target.site
      @deployment_target = deployment_target
      @object = object
    end

    def binary?
      false
    end

    def write
      file_path = File.join(deployment_target.build_path, relative_path)
      file_path = normalized_path!(file_path)
      FileUtils.mkdir_p(File.dirname(file_path))

      Rails.logger.info "Writing file: #{file_path}\n#{binary? ? '<binary>' : content}"

      write_method = binary? ? :binwrite : :write
      File.send(write_method, file_path, content)
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
