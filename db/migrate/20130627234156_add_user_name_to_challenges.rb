class AddUserNameToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :user_name, :string
  end
end
