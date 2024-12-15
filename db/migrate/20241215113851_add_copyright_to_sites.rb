class AddCopyrightToSites < ActiveRecord::Migration[8.0]
  def change
    add_column :sites, :copyright, :string, default: '© All rights reserved.'
  end
end
