class RemovePlmFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :plm
      end

  def down
    add_column :users, :plm, :boolean
  end
end
