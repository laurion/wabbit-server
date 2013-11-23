class AddPlmToUser < ActiveRecord::Migration
  def change
    add_column :users, :plm, :boolean

  end
end
