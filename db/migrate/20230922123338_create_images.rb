class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.integer :state
      t.string :source_url
      t.references :site, null: false, foreign_key: true, type: :uuid
      t.references :imageable, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
