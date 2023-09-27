class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages, id: :uuid do |t|
      t.string :title
      t.string :slug, index: { unique: true }
      t.string :emoji
      t.json :content
      t.references :site, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
