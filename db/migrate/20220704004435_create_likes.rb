class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :author
      t.belongs_to :book
      t.timestamps
    end
  end
end
