class RemoveInternalSubdomainFromSites < ActiveRecord::Migration[7.1]
  def change
    remove_column :sites, :internal_subdomain, :string, index: { unique: true }
  end
end
