# rubocop:disable Rails/ApplicationController

module Api
  class CaddyController < ActionController::Base
    def check_domain
      domain = params[:domain]

      target_exists = DeploymentTarget.non_backup.interal.exists?(
        public_hostname: domain
      )

      status = target_exists ? :ok : :not_found

      head(status)
    end
  end
end
# rubocop:enable Rails/ApplicationController
