class CreateSitesUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :site_users do |t|
      t.string :role, null: false, default: 'editor', index: true

      t.references :site, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.index %i[user_id site_id], unique: true
    end
  end
end
