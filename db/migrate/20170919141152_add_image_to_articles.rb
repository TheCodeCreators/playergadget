class AddImageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :image, :string
    add_column :articles, :teaser, :string
  end
end
