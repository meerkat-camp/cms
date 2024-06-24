class CreateNavigations < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TYPE navigation_type AS ENUM ('main', 'footer');
    SQL
    create_table :navigations, id: :uuid do |t|
      t.references :site, null: false, foreign_key: true, type: :uuid
      t.string :public_id, null: false, limit: 21, index: { unique: true }
      t.enum :type, enum_type: 'navigation_type', null: false

      t.index %i[site_id type], unique: true

      t.timestamps
    end
  end

  def down
    drop_table :navigations
    execute <<-SQL
      DROP TYPE navigation_type;
    SQL
  end
end
