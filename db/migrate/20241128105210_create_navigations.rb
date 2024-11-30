class CreateNavigations < ActiveRecord::Migration[8.0]
  def change
    create_table :navigations, id: :uuid do |t|
      t.string :public_id, limit: 21
      t.references :site, null: false, foreign_key: true, type: :uuid

      t.timestamps
      t.index :public_id, unique: true
    end

    Site.find_each do |site|
      Navigation.find_or_create_by(site: site)
    end
  end
end
