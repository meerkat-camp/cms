class AddStagingDeploymentsForEverySite < ActiveRecord::Migration[7.1]
  def up
    Site.find_each do |site|
      site.deployment_targets.create!(
        public_hostname: "#{site.id}.stage.#{ENV.fetch('BASE_HOSTNAME_AND_PORT')}",
        type: :staging, provider: :internal
      )
    end
  end

  def down
  end
end
