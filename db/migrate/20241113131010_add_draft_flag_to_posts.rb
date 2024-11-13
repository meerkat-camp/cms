class AddDraftFlagToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :draft, :boolean, default: false, null: false
    add_index :posts, :draft
  end
end
