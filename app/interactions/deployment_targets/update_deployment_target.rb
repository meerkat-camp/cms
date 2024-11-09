module DeploymentTargets
  class UpdateDeploymentTarget
    extend LightService::Action

    expects :deployment_target, :public_hostname, :type

    executed do |context|
      deployment_target = context.deployment_target

      deployment_target.assign_attributes(
        public_hostname: context.public_hostname,
        type: context.type
      )

      context.fail!(deployment_target.errors.full_messages.join(", ")) unless deployment_target.save
    end
  end
end
