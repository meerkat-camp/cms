class CreateNavigationItems < ActiveRecord::Migration[8.0]
  def change
    create_table :navigation_items, id: :uuid do |t|
      t.string :public_id
      t.references :navigation, null: false, foreign_key: true, type: :uuid
      t.references :page, null: false, foreign_key: true, type: :uuid
      t.integer :position

      t.timestamps

      t.index :public_id, unique: true
      t.index [:navigation_id, :position], unique: true
    end

    reversible do |dir|
      dir.up do
        NavigationItem.heal_position_column!
      end
    end
  end
end
