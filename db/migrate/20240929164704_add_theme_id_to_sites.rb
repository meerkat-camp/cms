class AddThemeIdToSites < ActiveRecord::Migration[7.2]
  def change
    add_reference :sites, :theme, type: :uuid, foreign_key: true

    Site.update_all(theme_id: Theme.first.id)

    change_column_null :sites, :theme_id, false
  end
end
