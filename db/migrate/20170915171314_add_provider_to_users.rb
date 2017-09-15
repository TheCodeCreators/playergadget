class AddProviderToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :steam_uid, :string
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    add_index :articles, :slug, unique: true
  end
end
