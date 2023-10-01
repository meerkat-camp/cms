class CreateDeploymentTargets < ActiveRecord::Migration[7.1]
  def change
    create_table :deployment_targets, id: :uuid do |t|
      t.references :site, null: false, foreign_key: true, type: :uuid
      t.integer :type, null: false
      t.string :public_hostname, null: false, index: { unique: true }
      t.string :provider, null: false
      t.text :encrypted_config

      t.timestamps
    end
  end
end
