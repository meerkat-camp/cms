class CreateSocialMediaLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :social_media_links, id: :uuid do |t|
      t.string :public_id, limit: 21
      t.string :name
      t.string :icon
      t.string :url
      t.references :site, null: false, foreign_key: true, type: :uuid

      t.timestamps
      t.index :public_id, unique: true
    end
  end
end
