class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :google_id
      t.string :mac_addr

      t.timestamps
    end
  end
end
