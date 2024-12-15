class AddEmojiToSites < ActiveRecord::Migration[8.0]
  def change
    # This needs to have a limit of 4 since there are very
    # complex emojis that can be up to 4 characters long
    add_column :sites, :emoji, :string, limit: 4, default: '🌐'
  end
end
