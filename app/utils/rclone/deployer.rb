module Rclone
  class Deployer
    attr_reader :site, :target, :rclone

    def initialize(site, target, rclone: Rclone)
      @site = site
      @target = target
      @rclone = rclone
    end

    def deploy
      source_dir = "#{site.hugo_dir}/public/"

      begin
        target.write_config_file
        rclone.run(['sync', '--config', target.config_file_path, source_dir, target.rclone_target], log: true)
      ensure
        target.delete_config_file
      end
    end
  end
end
