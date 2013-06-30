class AddClosedToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :closed, :bool, :default => false
    add_column :challenges, :closed_at, :datetime
  end
end
