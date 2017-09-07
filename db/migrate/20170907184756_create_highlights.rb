class CreateHighlights < ActiveRecord::Migration[5.1]
  def change
    create_table :highlights do |t|
      t.integer :position
      t.boolean :active, null: false, default: false
      t.references :article, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
