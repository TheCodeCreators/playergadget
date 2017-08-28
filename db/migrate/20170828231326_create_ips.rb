class CreateIps < ActiveRecord::Migration[5.1]
  def change
    create_table :ips do |t|
      t.string :label
      t.string :addr

      t.timestamps
    end
  end
end
