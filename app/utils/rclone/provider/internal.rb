module Rclone
  module Provider
    class Internal < Base
      def rclone_target
        static_site_path = ENV.fetch('STAGING_SITES_PATH')
        path = "#{static_site_path}/#{target.public_hostname.split(':').first}"
        FileUtils.mkdir_p(path)

        "internal:/#{path}"
      end

      def config_file_content
        <<~CONFIG
          [internal]
          type = local
        CONFIG
      end
    end
  end
end
