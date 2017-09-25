class AddOriginalsToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :original_article, references: :article
    add_reference :comments, :original_comment, references: :comment
  end
end
