class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :author
      t.belongs_to :book
      t.references :commentable, polymorphic: true
      t.text :text

      t.timestamps
    end
  end
end
