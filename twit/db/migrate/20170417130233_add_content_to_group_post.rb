class AddContentToGroupPost < ActiveRecord::Migration
  def change
    add_column :group_posts, :content, :text
  end
end
