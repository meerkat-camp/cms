class AddPublishAtTimestampToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :publish_at, :datetime

    reversible do |dir|
      dir.up do
        Post.update_all('publish_at = created_at')
      end
    end

    add_index :posts, :publish_at
  end
end
