class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :body
      t.integer :challenge_id

      t.timestamps
    end
  end
end
