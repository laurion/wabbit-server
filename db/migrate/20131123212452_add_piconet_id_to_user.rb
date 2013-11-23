class AddPiconetIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :piconet_id, :string

  end
end
