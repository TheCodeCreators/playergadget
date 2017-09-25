class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :commentable, polymorphic: true
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
