module Rclone
  class Deployer
    def self.deploy(deployment_target, rclone: CommandRunner)
      target = PROVIDERS.fetch(deployment_target.provider.to_sym).new(deployment_target)
      new(target, rclone:).deploy
    end

    attr_reader :site, :target, :rclone

    def initialize(target, rclone: CommandRunner)
      @target = target
      @rclone = rclone
    end

    def deploy
      target.write_config_file
      rclone.run(['sync', '--config', target.config_file_path, target.source_dir, target.rclone_target], log: true)
    ensure
      target.delete_config_file
    end
  end
end
