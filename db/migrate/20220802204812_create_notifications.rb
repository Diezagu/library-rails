class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.belongs_to :author, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end
