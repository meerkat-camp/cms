class DeploymentTargetsController < ApplicationController
  before_action :set_deployment_target, only: %i[edit update]

  def index
    @deployment_targets = current_site.deployment_targets
  end

  def edit
    authorize(@deployment_target)

    @deployment_target = DeploymentTargets::UpdateDeploymentTarget.new(
      deployment_target: @deployment_target,
      public_hostname: @deployment_target.public_hostname,
      type: @deployment_target.type
    )
  end

  def update
    authorize(@deployment_target)

    run_params = deployment_target_params.merge(deployment_target: @deployment_target)
    @deployment_target = DeploymentTargets::UpdateDeploymentTarget.run(run_params)

    return unless @deployment_target.valid?

    turbo_redirect_to(
      site_deployment_targets_path(@deployment_target.site),
      notice: t('.notice')
    )
  end

  private

  def deployment_target_params
    params.require(:deployment_target).permit(:public_hostname, :type).merge(current_user:)
  end

  def set_deployment_target
    @deployment_target = current_site.deployment_targets.find_by!(public_id: params[:id])
  end
end
