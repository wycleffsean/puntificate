class ChangeUsersNameColumn < ActiveRecord::Migration
  def up
    change_column :users, :name, :string, :default => "", :null => false
  end

  def down
  end
end
