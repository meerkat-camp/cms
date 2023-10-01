module Rclone
  module Provider
    class Fastmail < Base
      def rclone_target
        path = "/#{email.tr('@', '.')}/files#{config.fetch('path')}"
        "fastmail:#{path}"
      end

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

      private

      def email
        config.fetch('email')
      end

      def obscured_password
        @rclone.run(['obscure', config.fetch('password')]).fetch(:stdout)
      end
    end
  end
end
