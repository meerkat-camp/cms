class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites, id: :uuid do |t|
      t.string :internal_subdomain, index: { unique: true }
      t.string :domain, index: { unique: true }
      t.string :title
      t.string :language_code

      t.timestamps
    end
  end
end
