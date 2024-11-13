class FixSlugUniquenessAccrossDifferentSites < ActiveRecord::Migration[8.0]
  def change
    remove_index :posts, :slug
    add_index :posts, [:slug, :site_id], unique: true
  end
end
