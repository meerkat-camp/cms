class DeploymentTarget < ApplicationRecord
  self.inheritance_column = 'sti_type'

  belongs_to :site

  encrypts :config
  serialize :config, coder: JSON

  validates :public_hostname, presence: true, uniqueness: true
  validates :provider, presence: true, inclusion: { in: Rclone::PROVIDERS.keys.map(&:to_s) }
  validates :type, presence: true

  enum type: { staging: 0, production: 1 }
end
