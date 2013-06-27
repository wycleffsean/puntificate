class AddUserNameToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :user_name, :string
  end
end
