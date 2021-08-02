class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follower_id

      t.timestamps
    end
  end
end
