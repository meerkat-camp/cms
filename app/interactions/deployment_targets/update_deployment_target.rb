module DeploymentTargets
  class UpdateDeploymentTarget < ActiveInteraction::Base
    object :deployment_target, class: DeploymentTarget
    object :current_user, class: User
    delegate :site, to: :deployment_target

    string :public_hostname

    string :type
    validates :type, presence: true, inclusion: { in: DeploymentTarget.types.keys }

    def execute
      deployment_target.assign_attributes(public_hostname:, type:)

      errors.merge!(deployment_target.errors) unless deployment_target.save

      deployment_target
    end
  end
end
