module Rclone
  class DeployJob < ApplicationJob
    def perform(deployment_target, deployer: Deployer, noticer: Noticer)
      deployer.deploy(deployment_target)

      noticer.new(deployment_target.site).notice(
        "Site built. <a href='https://#{deployment_target.public_hostname}'>Preview</a>"
      )
    end
  end
end
