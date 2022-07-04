class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :author
      t.belongs_to :book
      t.timestamps
    end
    add_foreign_key :likes, :books, column: :book_id
    add_foreign_key :likes, :users, column: :author_id
    add_index :likes, [:author_id, :book_id], unique: true
  end
end
