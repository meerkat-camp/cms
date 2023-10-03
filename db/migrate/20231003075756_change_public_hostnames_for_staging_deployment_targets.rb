class ChangePublicHostnamesForStagingDeploymentTargets < ActiveRecord::Migration[7.1]
  def change
    DeploymentTarget.where(type: :staging).find_each do |target|
      target.update!(public_hostname: "#{target.site.public_id}.stage.#{ENV.fetch('BASE_HOSTNAME_AND_PORT')}")
    end
  end
end
