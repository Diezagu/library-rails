# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :pages, null: false
      t.belongs_to :author

      t.timestamps
    end
  end
end
