class AddPictureToGroupPost < ActiveRecord::Migration
  def change
    add_column :group_posts, :picture, :string
  end
end
