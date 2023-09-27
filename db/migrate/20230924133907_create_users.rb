class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false
      t.index :email, unique: true
      t.datetime :last_login_at
      t.timestamps
    end
  end
end
