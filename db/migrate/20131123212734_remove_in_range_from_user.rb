class RemoveInRangeFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :in_range
      end

  def down
    add_column :users, :in_range, :boolean
  end
end
