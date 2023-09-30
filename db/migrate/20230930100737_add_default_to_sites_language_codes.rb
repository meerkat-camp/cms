class AddDefaultToSitesLanguageCodes < ActiveRecord::Migration[7.1]
  def change
    change_column_default :sites, :language_code, from: '', to: 'en'
    Site.where(language_code: [nil, '']).update_all(language_code: 'en')
    change_column_null :sites, :language_code, false
  end
end
