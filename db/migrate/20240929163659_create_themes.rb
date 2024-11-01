class CreateThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :themes, id: :uuid do |t|
      t.string :name, null: false
      t.string :public_id, limit: 21, null: false
      t.string :description
      t.string :hugo_theme, null: false

      t.timestamps
    end

    add_index :themes, :public_id, unique: true

    reversible do |direction|
      direction.up do
        Theme.create!(
          name: 'Simple Emoji',
          description: 'A playfull simple theme that supports emoji.',
          hugo_theme: 'simple_emoji'
        )

        Theme.create!(
          name: 'Ink',
          description: 'Crisp, minimal personal website and blog theme Hugo.',
          hugo_theme: 'ink'
        )
      end
    end
  end
end
