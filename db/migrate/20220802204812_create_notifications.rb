class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :text
      t.belongs_to :author

      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :author_id
  end
end
