class AddNanoIdToAllTables < ActiveRecord::Migration[7.1]
  MODELS = [Site, Post, Page, Image, User, SiteUser, DeploymentTarget]

  def change
    MODELS.each do |model|
      # Add the column
      add_column model.table_name, :public_id, :string, limit: 21
      add_index model.table_name, :public_id, unique: true

      # Generate public ids for existing records
      model.reset_column_information
      model.find_each do |record|
        record.set_public_id
        record.save!
      end

      # Make the column non-nullable
      change_column_null model.table_name, :public_id, false
    end
  end
end
