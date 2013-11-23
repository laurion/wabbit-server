class AddInRangeToUser < ActiveRecord::Migration
  def change
    add_column :users, :in_range, :boolean

  end
end
