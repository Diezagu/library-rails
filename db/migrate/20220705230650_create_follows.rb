class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.belongs_to :follower
      t.belongs_to :followee

      t.timestamps
    end
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followee_id
    add_index :follows, [:followee_id, :follower_id], unique: true
  end
end
