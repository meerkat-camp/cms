module Rclone
  module Target
    class Fastmail
      attr_reader :target

      delegate :config, to: :target

      def initialize(target, rclone: CommandRunner)
        @target = target
        @rclone = rclone
      end

      def write_config_file
        FileUtils.mkdir_p(File.dirname(config_file_path))

        File.write(config_file_path, config_file_content)
      end

      def delete_config_file
        return unless File.exist?(config_file_path)

        File.delete(config_file_path)
      end

      def config_file_path
        Rails.root.join("tmp", "rclone", "#{target.id}.conf").to_s
      end

      def rclone_target
        path = "/#{email.tr('@', '.')}/files#{config.fetch('path')}"
        "fastmail:#{path}"
      end

      private

      def config_file_content
        <<~CONFIG
          [fastmail]
          type = webdav
          url = https://webdav.fastmail.com/
          vendor = fastmail
          user = #{email}
          pass = #{obscured_password}
        CONFIG
      end

      def email
        config.fetch('email')
      end

      def obscured_password
        @rclone.run(['obscure', config.fetch('password')]).fetch(:stdout)
      end
    end
  end
end
