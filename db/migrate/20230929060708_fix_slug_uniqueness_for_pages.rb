class FixSlugUniquenessForPages < ActiveRecord::Migration[7.1]
  def change
    change_table :pages, bulk: true do |t|
      t.remove_index :slug
      t.index %i[slug site_id], unique: true
    end
  end
end
