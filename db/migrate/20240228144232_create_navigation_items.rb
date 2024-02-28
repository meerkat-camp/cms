class CreateNavigationItems < ActiveRecord::Migration[7.1]
  def change
    create_table :navigation_items, id: :uuid do |t|
      t.string :public_id, null: false, limit: 21, index: { unique: true }
      t.references :navigation, null: false, foreign_key: true, type: :uuid
      t.uuid :parent_id
      t.string :title, null: false
      t.string :linked_object_type
      t.uuid :linked_object_id
      t.string :external_url
      t.boolean :new_tab

      t.index %i[navigation_id parent_id title], unique: true
      t.timestamps
    end
  end
end
