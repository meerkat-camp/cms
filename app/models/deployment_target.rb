class DeploymentTarget < ApplicationRecord
  belongs_to :site

  encrypts :config
  serialize :config, coder: JSON
end
