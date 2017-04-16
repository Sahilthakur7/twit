class CreateGroupRelationships < ActiveRecord::Migration
  def change
    create_table :group_relationships do |t|
      t.integer :member_id
      t.integer :group_id

      t.timestamps null: false
    end
    add_index :group_relationships, :member_id
    add_index :group_relationships, :group_id
    add_index :group_relationships, [:member_id, :group_id], unique: true
  end
end
