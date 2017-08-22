# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :body
      t.datetime :published_at
      t.integer :comments_count, null: false, default: 0
      t.text :intro
      t.string :slug
      t.integer :likes_count, null: false, default: 0

      t.timestamps
    end
  end
end
