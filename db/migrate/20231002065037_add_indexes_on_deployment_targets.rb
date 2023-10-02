class AddIndexesOnDeploymentTargets < ActiveRecord::Migration[7.1]
  def change
    add_index :deployment_targets, :type
    add_index :deployment_targets, :provider
  end
end
