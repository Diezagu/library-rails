class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :author
<<<<<<< HEAD
<<<<<<< HEAD
      t.belongs_to :book
=======
>>>>>>> 6e98d92... Create like model
=======
      t.belongs_to :book
>>>>>>> b1a132f... Create likes controller
      t.timestamps
    end
  end
end
