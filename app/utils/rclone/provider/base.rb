module Rclone
  module Provider
    class Base
      attr_reader :target

      delegate :config, to: :target

      def initialize(target, rclone: CommandRunner)
        @target = target
        @rclone = rclone
      end

      def source_dir
        "#{target.site.hugo_dir}/public/"
      end

      def rclone_target
        raise NotImplementedError
      end


      def write_config_file
        FileUtils.mkdir_p(File.dirname(config_file_path))
        File.write(config_file_path, config_file_content)
      end

      def config_file_path
        Rails.root.join("tmp", "rclone", "#{target.id}.conf").to_s
      end

      def config_file_content
        raise NotImplementedError
      end

      def delete_config_file
        return unless File.exist?(config_file_path)

        File.delete(config_file_path)
      end
    end
  end
end
